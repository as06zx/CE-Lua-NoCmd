local functions = {
   os.execute,
   io.popen,
   shellExecute
}

for i=1, #functions do
   local func = functions[i]
   local addr = tostring(func):gsub("function: ", "")
   addr = getAddressSafe(addr, true)
   if addr then
      writeByteLocal(addr, 0xC3)
   else
      printf("Failed to getAddressSafe: %x", addr)
   end
end