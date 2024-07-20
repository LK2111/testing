-- URL der Audio-Datei
local url = "https://cdn.discordapp.com/attachments/442358127254306836/1264243528305741905/arkpatrol.dfpwm?ex=669d2a09&is=669bd889&hm=0987222629e323bb2cf00533a1907eda9a2ff73fd5adca15b36825e902dddd73"

-- Funktion zum Herunterladen der Datei
local function downloadFile(url, filename)
    local response = http.get(url)
    if response then
        local file = fs.open(filename, "wb")
        file.write(response.readAll())
        file.close()
        response.close()
        print("Datei heruntergeladen:", filename)
    else
        print("Fehler beim Herunterladen der Datei")
    end
end

-- Herunterladen der Audio-Datei
local filename = "arkpatrol.dfpwm"
downloadFile(url, filename)

-- Funktion zum Abspielen der Datei auf den Lautsprechern
local function playOnSpeakers(file, speakers)
    for _, speakerName in ipairs(speakers) do
        local speaker = peripheral.wrap(speakerName)
        if speaker then
            speaker.playAudio(file)
            print("Abspielen auf:", speakerName)
        else
            print("Lautsprecher nicht gefunden:", speakerName)
        end
    end
end

-- Liste der Lautsprecher
local speakers = {"speaker_1", "speaker_2", "speaker_3"}

-- Abspielen der Datei auf den Lautsprechern
playOnSpeakers(filename, speakers)
