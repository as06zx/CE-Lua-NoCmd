local str_execute = tostring(os.execute)
local str_popen = tostring(io.popen)
local str_shell = tostring(shellExecute)

local addr_execute = getAddressSafe(str_execute:gsub("function: ", ""))
local addr_popen = getAddressSafe(str_popen:gsub("function: ", ""))
local addr_shell = getAddressSafe(str_shell:gsub("function: ", ""))

if addr_execute and addr_popen and addr_shell then
   writeByteLocal(addr_execute, 0xC3)
   writeByteLocal(addr_popen, 0xC3)
   writeByteLocal(addr_shell, 0xC3)
else
    printf("Failed to getAddressSafe, str is '%s', '%s', '%s'",
    str_execute, str_popen, addr_shell)
end