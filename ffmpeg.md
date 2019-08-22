

I compressed a 40-minute HD video presentation from 505MB to 183MB
That's like going from 100MB → 36MB.
Original video was HD and output was almost zero noticeable difference.
It's a video file "I'd like to keep around, but HD is overkill."
Here's the command I used with reasons:

ffmpeg -n -loglevel error -i inputfile.mp4 -vcodec libx264 -crf 28 -preset faster -tune film outputfilename.mp4

    -n : avoid overwriting output files (safer for testing then batching)
    -loglevel error : show errors and hide the rows and rows of progress
    -i inputfile.mp4 : input file name
    -vcodec libx264 : swiped from the top answer above
    -crf 28 : single-pass compression with minor noticeable difference ("0 = lossless, 23 = default, 51 = worst; subjectively sane range is 17–28") ref docs
    -preset faster : looks 2x faster than default encoding time of 'medium' ref docs
    -tune film : specify input is an HQ video (other options include 'cartoon', 'stillimage'..) ref docs
    outputfilename.mp4 : output file name

For a directory of video files:

for i in *.{avi,flv,m4v,mov,wmv,mp4,MP4,TS,mkv}; do ffmpeg -n -loglevel error -i "$i" -vcodec libx264 -crf 28 -preset faster -tune film "cc${i}"; done

Issues:

    a cleaner way of collecting "all video files" without having all the extensions in the command
    a cleaner way to output the filename without "cc" prefix, AND being able to confirm video before deleting
    .webm files don't work with the command. Had to swap "cc${i}" → "${i%.*}.mp4"

ffmpeg -n -loglevel error -i inputfile.mp4 -vcodec libx264 -crf 28 -preset faster -tune film outputfilename.mp4
