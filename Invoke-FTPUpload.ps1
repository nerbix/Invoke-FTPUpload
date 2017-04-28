function Invoke-FTPUpload {
    param ([string] $dir, [string] $user, [string] $server, [string] $password)
    

#ftp server   

$webclient = New-Object System.Net.WebClient 
$webclient.Credentials = New-Object System.Net.NetworkCredential($user,$password)  

Foreach($item in (dir $dir)){ 
    "Uploading $item..."  
    $uri = New-Object System.Uri($server+$item.Name) 
    $webclient.UploadFile($uri, $item.FullName) 

 } 
}
