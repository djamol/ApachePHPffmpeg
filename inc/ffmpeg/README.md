Root Required

Enable Shared
your execute from php code

example code:
```<?php
$ffmpegPath = exec('which ffmpeg');
//$ffprobe = exec('ffmpeg -v');
echo $ffmpegPath.'<br>';
$srcFile ='video.mp4';
$waterm ='128.png';
$destFile ='v3.mp4';
//exec($ffmpegPath . " -i " . $srcFile . " -i " . $waterm . ' -filter_complex "overlay=10:10" ' . $destFile);
?>
```
