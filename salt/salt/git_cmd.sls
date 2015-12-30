 git_clone:
   git.latest:
     - name: {{ pillar['repository'] }}
     - https_user: {{ pillar['https_user'] }}
     - https_pass: 
     - target: {{ pillar['git_clone_directory'] }}
     - submodules: True
     - force_clone: {{ pillar['greate_directory_git'] }}




 bulid_sh:
   cmd.run:
     - name: {{ pillar['git_clone_directory'] }}/build.sh
 init_sh:
   cmd.run:
     - name: {{ pillar['git_clone_directory'] }}/init.sh

