local version
local changelogArray = {}
PerformHttpRequest("https://raw.githubusercontent.com/it-zeusx/VersionChecker/refs/heads/main/zsx_uiv2", function(err, text, headers)
    version = tostring(string.gsub(text, "%s+", ""))
end, 'GET', '')

PerformHttpRequest("https://raw.githubusercontent.com/it-zeusx/VersionChecker/refs/heads/main/uiv2_changelog", function(err, text, headers)
    if err == 200 then

        for line in text:gmatch("[^\r\n]+") do
            table.insert(changelogArray, line)
        end
    else
        print("Error fetching changelog:", err)
    end
end, 'GET', '')

Citizen.CreateThread(function()
    Wait(2000)
    debugPrint('Checking version [/]')
    local currentVersion = GetResourceMetadata(GetCurrentResourceName(),"version") and tostring(GetResourceMetadata(GetCurrentResourceName(),"version")) or false
    local versionErrHandle
    while not version do Wait(100) end
    
    if not currentVersion then versionErrHandle = "MISSING_VER_MNF" end
    if currentVersion and version ~= currentVersion then versionErrHandle = "MNF_DIFF_VER" end 
    if version == currentVersion then versionErrHandle = "VER_OKAY" end
    print("=========================================================== ^2USER INTERFACE V2^7 ===========================================================")
    print("| RELEASE VERSION [^2"..version.."^7]")
    if versionErrHandle ~= "VER_OKAY" then
        print("| CURRENT VERSION ["..(currentVersion and "^2"..currentVersion or '^1MISSING MANIFEST').."^7]")
        print("| ")
        print("| ")
        print("| STATUS ["..(versionErrHandle == "MISSING_VER_MNF" and "^8MISSING_VER_MNF^7" or versionErrHandle == "MNF_DIFF_VER" and "^9MNF_DIFF_VER^7").."]")
        print("| ")
        if versionErrHandle == "MISSING_VER_MNF" then
            print("| ^1YOUR VERSION DOES NOT INCLUDE VERSION IN MANIFEST.^7")
        end
        if versionErrHandle == "MNF_DIFF_VER" then
            print("| ^9NEW UPDATE IS AVAILABLE^7")
        end
        print("| ^9PLEASE UPDATE THE RESOURCE.^7")
    else
        print("| ")
        print("| ^2EVERYTHING IS UP TO DATE^7!")
    end
    if Config.DumpChangelog and #changelogArray > 0 then
        print("| ")
        print("| ")
        print("| ^6CHANGELOG^7:")
        for k,v in ipairs(changelogArray) do
            print("|   "..v)
        end
        print("| ")
        print("| ")
    end
    print("=========================================================================================================================================")
end)