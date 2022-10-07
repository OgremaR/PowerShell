$RND = Get-Content .\RND.txt
$VLG = Get-Content .\VLG.txt
$KDAR = Get-Content .\KDAR.txt
$user = whoami
$user = $user.Substring(3)
if ($user -in $RND){
    D:\Service\start1c_tsd_rnd.bat
}
elseif ($user -in $VLG){
    D:\Service\start1c_tsd_volg.bat
}
elseif ($user -in $KDAR){
    D:\Service\start1c_tsd_kdar.bat
}
else{
    exit
}
