$paths = "/Applications/ZoomVDI.app", 
    "/Library/Application Support/Citrix Receiver/Citrix Viewer.app",
    "/Applications/Citrix Workspace.app",
    "/usr/local/libexec/ServiceRecords.app",
    "/usr/local/libexec/AuthManager_Mac.app",
    "/usr/local/libexec/Citrix Workspace Helper.app"

$backupsPath = "~/_ops/citrix-backups" 

$ErrorActionPreference = "Stop"

function _gettarg {
    param (
        [string]$src,
        [string]$suffix
    )

    return  Join-Path $backupsPath "$src--$suffix";

}
function Switch-Citrix {
    param (
        [String]$suffix
    )

    pkill ZoomVDI
    pkill "Citrix Workspace Authentication"
    pkill "Citrix Service Record Application"

    $paths | %{ 
        $targ = _gettarg $_ $suffix
        Write-Host "Attempting to restore $targ"
        if (test-path $targ) {
            if (test-path $_) {
                Write-Host "Removing $_"
                remove-item -Recurse -Force $_
            }
            Write-Host "Linking $_ to $targ"
            Copy-Item -Recurse $targ $_
        }
    }
    

}

function Backup-Citrix {
    param (
        [String]$suffix
    )

    $paths | %{ 
        $targ = _gettarg $_ $suffix
        if (test-path $targ) {
            move-item $targ "$targ.$(get-date -Format "yyyyMMddHHmmss")"
        }
        Copy-Item -Recurse $_ $targ
    }
}


# https://www.citrix.com/en-in/downloads/workspace-app/betas-and-tech-previews/workspace-app-tp-for-mac-native-support-for-silicon-mac-beta.html