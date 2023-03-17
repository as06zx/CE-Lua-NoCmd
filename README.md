# CE-Lua-NoCmd

Short Script for Cheat Engine's Lua.

Cheat Engine's Lua scripting feature allows users to automate game cheats and modify game memory, but it's important to prevent the execution of system commands to avoid unintended consequences or malicious attacks.

Using this Script, it is possible to prevent the execution of system commands in Lua scripts within Cheat Engine.

### How it works

This script retrieves the addresses of specific functions that can be used to execute system commands, and then modifies the first byte of each address to 0xC3, which is the opcode for a return instruction.

```lua
local str_execute = tostring(os.execute) --> function: 00007FFB93C0FFD0
local addr_execute = getAddressSafe(str_execute:gsub("function: ", "")) --> 00007FFB93C0FFD0

if addr_execute then
   writeByteLocal(addr_execute, 0xC3) --> edit first byte to ret
else
    printf("Failed to getAddressSafe, str is '%s'", str_execute)
end
```