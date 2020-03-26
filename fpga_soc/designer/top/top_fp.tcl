new_project \
         -name {top} \
         -location {B:\SVN\Customers\Arrow\SF2000\SMFSDRAM\designer\top\top_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
