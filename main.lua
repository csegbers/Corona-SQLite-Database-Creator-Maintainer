


--====================================================================--
--  requires test
--====================================================================-- 
 
local dbmodule = require("dbmodule") 
local myApp = require( "myapp" ) 
require( "sqlite3" ) 

--
-- turn on debugging
--
local debugMode = true
local retsta,reterr

--
-- this little snippet will make a copy of the print function
-- and now will only print if debugMode is true
-- quick way to clean up your logging for production
-- 

reallyPrint = print
function print(...)
    if debugMode then
        reallyPrint(unpack(arg))
    end
end

print("<-==================== Program Start ====================->") 

myApp.mytestdb = {}
myApp.mytestdb.dbname = "test.db"
myApp.mytestdb.dbpath = system.pathForFile(myApp.mytestdb.dbname, system.DocumentsDirectory)
myApp.mytestdb.dbconfig = require("testdbconfig")
myApp.mytestdb.compactdb = true

retsta,reterr = dbmodule.fncDBLoad(myApp.mytestdb)
if not retsta then print ("<-======== Error On Open =========-> ".. reterr) end
 
 --myApp.mytestdb.dbref:exec( [[insert into ]] .. [[tblLES]] .. [[(]] ..  [[lestitle]] .. [[) values(]] .. [['mememe']] .. [[)]] )

dbmodule.fncDBClose(myApp.mytestdb)

 
 
  





