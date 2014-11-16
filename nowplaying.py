import subprocess
import time

def get_song():
    p = subprocess.Popen('cmus-remote -Q | grep "artist" -A2', shell=True, stdout=subprocess.PIPE)
    line = p.communicate()[0]
    print(line)
    artist_line = line.decode("utf-8").split('\n')[0]
    title_line = line.decode("utf-8").split("\n")[1]
    artist = artist_line.replace("tag artist ", "")
    if title_line.startswith("tag album"):
        title_line = line.decode("utf-8").split("\n")[2]
    title = title_line.replace("tag title ", "")

    print(artist + " - " + title)

    f = open("/home/peter/.xonotic/data/nowplaying.cfg", "w")
    f.write("say now playing: " + artist + " - " + title)

    retval = p.wait()

if __name__ == "__main__":
    while(1):
        try:        
            get_song()
        except IndexError:
            time.sleep(5)
        except KeyboardInterrupt:
            exit(0)
        time.sleep(10)
