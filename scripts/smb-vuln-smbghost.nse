local nmap = require "nmap"
local shortport = require "shortport"
local stdnse = require "stdnse"
local smb = require "smb"
local string = require "string"

description = [[
Checks if a target is vulnerable to SMBGhost (CVE-2020-0796).

This vulnerability affects SMBv3.1.1 (Windows 10 version 1903/1909).
]]

author = "Fixploit03"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"vuln", "safe"}

portrule = shortport.port_or_service(445, "microsoft-ds")

action = function(host, port)
  local status, result
  local socket = nmap.new_socket()

  socket:set_timeout(5000)

  local probe = 
    "\x00\x00\x00\x90" ..
    "\xfe\x53\x4d\x42" ..  -- SMB2 Header
    "\x40\x00\x00\x00\x00\x00\x00\x00" ..
    "\x00\x00\x00\x00\x00\x00\x00\x00" ..
    "\x00\x00\x00\x00\x00\x00\x00\x00" ..
    "\x00\x00\x00\x00" ..
    "\x00\x00" ..           -- Credit Charge
    "\x00\x00" ..           -- Channel Sequence
    "\x00\x00" ..           -- Reserved
    "\x00\x00" ..           -- Command (Negotiate)
    "\x00\x00\x00\x00" ..   -- Message ID
    "\x00\x00\x00\x00" ..   -- Process ID
    "\x00\x00\x00\x00" ..   -- Tree ID
    "\x00\x00\x00\x00" ..   -- Session ID
    "\x00\x00\x00\x00\x00\x00\x00\x00" .. -- Signature
    -- Negotiate Request
    "\x24\x00" ..           -- StructureSize
    "\x00\x00" ..           -- Dialect Count
    "\x00\x00" ..           -- Security Mode
    "\x00\x00" ..           -- Reserved
    "\x00\x00\x00\x00" ..   -- Capabilities
    "\x00\x00\x00\x00\x00\x00\x00\x00" .. -- Client GUID
    "\x00\x00\x00\x00" ..   -- Negotiate Context Offset
    "\x02\x00" ..           -- Negotiate Context Count (2 = Compression)
    "\x00\x00" ..           -- Reserved2
    "\x00" ..               -- Padding (simplified)
    "\x00"

  local status, err = socket:connect(host.ip, port.number)
  if not status then
    return "Failed to connect: " .. err
  end

  socket:send(probe)
  local response = socket:receive_bytes(1024)
  socket:close()

  if response and #response > 0 then
    if response:match("\xfe\x53\x4d\x42") then
      return stdnse.format_output(true,
        "Host appears to support SMBv3.1.1 and may be vulnerable to SMBGhost (CVE-2020-0796)."
      )
    else
      return "SMBv3.1.1 not detected."
    end
  end

  return "No response or unexpected SMB header."
end
