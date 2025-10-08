# /etc/nixos/modules/borgbackup.nix

{ config, lib, ... }:

with lib;

let
  cfg = config.services.myBorgbackup;
in
{
  # Define the options that users can set
  options.services.myBorgbackup = {
    enable = mkEnableOption "Enable custom BorgBackup module";

    user = mkOption {
      type = types.str;
      description = "The user to run borg as.";
    };

    sshKeyPath = mkOption {
      type = types.path;
      description = "Absolute path to the SSH private key for borg repository access.";
      example = "/home/dane/.ssh/id_borg";
    };

    repoUrl = mkOption {
      type = types.str;
      description = "The base URL for the remote repository.";
      example = "ssh://user@example.com/media/backup";
    };

    commonExcludes = mkOption {
      type = types.listOf types.str;
      default = [
        ".cache"
        "*/cache2" # firefox
        "*/Cache"
        ".config/Slack/logs"
        ".config/Code/CachedData"
        ".container-diff"
        ".npm/_cacache"
        "*/node_modules"
        "*/bower_components"
        "*/_build"
        "*/.tox"
        "*/venv"
        "*/.venv"
      ];
      description = "List of patterns to exclude from all backup jobs.";
    };

    jobs = mkOption {
      type = types.attrsOf (types.submodule {
        options = {
          paths = mkOption {
            type = with types; either str (listOf str);
            description = "The path or paths to back up for this job.";
          };
          extraExcludes = mkOption {
            type = types.listOf types.str;
            default = [];
            description = "Additional exclude patterns specific to this job.";
            example = [ "Downloads" ];
          };
          startAt = mkOption {
            type = types.str;
            default = "daily";
            description = "When to run the backup job (e.g., daily, weekly).";
          };
        };
      });
      default = {};
      description = "Attribute set of backup jobs to create.";
    };
  };

  # Generate the configuration based on the options
  config = mkIf cfg.enable {
    services.borgbackup.jobs =
      # `mapAttrs` iterates over each job defined in `cfg.jobs`
      mapAttrs (jobName: jobConfig:
        let
          # Ensure `paths` is always a list for consistency
          pathsList = if (builtins.isList jobConfig.paths) then jobConfig.paths else [ jobConfig.paths ];
          # Combine common and job-specific excludes, prefixing them with each path
          excludes = builtins.concatLists (map (path:
            map (excludePattern: "${path}/${excludePattern}") (cfg.commonExcludes ++ jobConfig.extraExcludes)
          ) pathsList);
        in
        {
          # These settings are common to all jobs
          encryption.mode = "none";
          environment.BORG_RSH = "ssh -o 'StrictHostKeyChecking=no' -i ${cfg.sshKeyPath}";
          environment.BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
          extraCreateArgs = "--verbose --stats --checkpoint-interval 600";
          compression = "zstd,1";
          user = cfg.user;

          # These settings are specific to the current job
          repo = "${cfg.repoUrl}/backups/station/${jobName}";
          paths = pathsList;
          exclude = excludes;
          startAt = jobConfig.startAt;
        }
      ) cfg.jobs;
  };
}
