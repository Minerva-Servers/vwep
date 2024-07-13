function vwep.util:Notify(ply, message)
    if ( !IsValid(ply) ) then return end
    if ( ply:IsBot() ) then return end

    if ( CLIENT ) then
        chat.AddText(vwep.info.color, "[VWEP] ", Color(255, 255, 255), message)
    else
        net.Start("VWEP.Notify")
            net.WriteString(message)
        net.Send(ply)
    end
end

function vwep.util:NotifyAll(message)
    for _, v in ipairs(vwep.util:GetPlayers()) do
        vwep.util:Notify(v, message)
    end
end

function vwep.util:NotifyAdmins(message)
    for _, v in ipairs(vwep.util:GetPlayers()) do
        if ( v:IsAdmin() ) then
            vwep.util:Notify(v, message)
        end
    end
end

do
    if ( SERVER ) then
        util.AddNetworkString("VWEP.Notify")
    else
        net.Receive("VWEP.Notify", function()
            local message = net.ReadString()

            vwep.util:Notify(LocalPlayer(), message)
        end)
    end
end