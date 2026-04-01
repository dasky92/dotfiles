if status is-interactive                                                                          
    # Commands to run in interactive sessions can go here                                         
end                                                                                               
                                                                                                  
# ==============================================                                                  
# 自动同步 bash 环境到 fish                                                                       
# ==============================================                                                  
# set -gx PATH (bash -c 'source ~/.profile 2>/dev/null; source ~/.bashrc 2>/dev/null; echo -n $PATH' \
#     | string split ":" \
#     | string trim) $PATH
                                                                                                  
# 自动激活 mise                                                                         
if command -v mise > /dev/null 2>&1                                                               
   mise activate fish | source                                                                    
end 