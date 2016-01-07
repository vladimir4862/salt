 git_clone:
   git.latest:
     - name: {{ pillar['repository'] }}
     - https_user: {{ pillar['https_user'] }}
     - https_pass: {{ pillar['https_pass'] }}
     - target: {{ pillar['git_clone_directory'] }}
     - force_clone: {{ pillar['greate_directory_git'] }}
# Init and update submodules, use module.run because "git.latest.submodule: True"  is not working.
 git_clone_submodule:
    module.run:
      - name: git.submodule
      - cwd: {{ pillar['git_clone_directory'] }}
      - command: update
      - opts: '--init'
      - require:
        - git: git_clone


 bulid_sh:
   cmd.run:
     - name: {{ pillar['git_clone_directory'] }}/build.sh
     - cwd: {{ pillar['git_clone_directory'] }}
     - require:
       - git: git_clone

 init_sh:
   cmd.run:
     - name: {{ pillar['git_clone_directory'] }}/init.sh
     - cwd: {{ pillar['git_clone_directory'] }}
     - require:
       - cmd: bulid_sh

