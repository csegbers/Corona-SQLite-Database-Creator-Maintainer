local M = {}

---------------------------------------------------
-- Database User Defaults
--
-- note UNIQUE and NOT NULL apparently are not allowed with this sqlite
--
-- DEFAULT values will update existing records and new records !!
---------------------------------------------------	
M.dbenvironment = {}
M.dbschema = { 
	         UD = {   
					table = "tblUD",
					key= "udid",
					keyatt = "INTEGER PRIMARY KEY",
					defrec = 1,
					fields= {
								pin = {name="udpin",title="PIN",att="TEXT", def="",reset=false},
								
								userid = {name="uduserid",title="UserID",att="TEXT", def="",reset=false},
								fullname = {name="udfullname",title="Full Name",att="TEXT", def="",reset=false},
								email = {name="udemail",title="Email",att="TEXT", def="",reset=false,inputparms = {type = "email"}},
								pw={name="udpw",title="Password",att="TEXT",storehashed=true,inputparms = {secure = true},reset=false},
								accountcreated={name="udaccountcreated",title="Account Created",att="INTEGER", def=0,reset=false},
								
								defschool={name="uddefschool",title="School",att="INTEGER"},
								displayrecycledlessons={name="uddisplayrecycledlessons",title="Display Recycled Lessons",att="INTEGER", def=0},
								recycledlessonspurgedays={name="udrecycledlessonspurgedays",title="Recycled Lessons Purge days",att="INTEGER", def=90,min=1,max=180},
								lastcompactdate={name="udlastcompactdate",title="Last Compact Date",att="INTEGER" ,def="currentdate"},
								audiolengthmax={name="udaudiolengthmax",title="Max Audio Length",att="INTEGER", def=30,min=10,max=60},
								playsounds={name="udplaysounds",title="Play Sounds",att="INTEGER", def=1},
								vibration={name="udvibration",title="Use Vibration",att="INTEGER", def=1},
								shufflequestions={name="udshufflequestions",title="Shuffle Questions",att="INTEGER", def=0},
								loopthruincorrect={name="udloopthruincorrect",title="Repeat Incorrect Answers",att="INTEGER", def=1},
								texttospeech={name="udtexttospeech",title="Use Text To Speech",att="INTEGER", def=1},
								swipequestionadvance={name="udswipequestionadvance",title="Allow Swiping For Question Advance",att="INTEGER", def=1},
								tiltquestionadvance={name="udtiltquestionadvance",title="Allow Tilting For Question Advance",att="INTEGER", def=1},
								leftorrighthand={name="udleftorrighthand",title="Left Or Right Handed",att="INTEGER", def=0,notes="0 is right handed used for tilting"},
								tiltsensitivity={name="udtiltsensitivity",title="Tilt Sensitivity",att="INTEGER", def=20,min=10,max=60},
								picscalestudy={name="udpicscalestudy",title="Picture Scale",att="INTEGER", def=50,min=10,max=100},
								
								backgroundtopcolor1={name="udbackgroundtopcolor1",title="Background R",att="INTEGER", def=212 ,globalrefresh=true},   					 
								backgroundtopcolor2={name="udbackgroundtopcolor2",title="Background G",att="INTEGER", def=228 ,globalrefresh=true},
								backgroundtopcolor3={name="udbackgroundtopcolor3",title="Background B",att="INTEGER", def=239 ,globalrefresh=true},
								
								backgroundbotcolor1={name="udbackgroundbotcolor1",title="Background R",att="INTEGER", def=134 ,globalrefresh=true},
								backgroundbotcolor2={name="udbackgroundbotcolor2",title="Background G",att="INTEGER", def=174 ,globalrefresh=true},
								backgroundbotcolor3={name="udbackgroundbotcolor3",title="Background B",att="INTEGER", def=204 ,globalrefresh=true},
								
								qbackgroundtopcolor1={name="udqbackgroundtopcolor1",title="Background R",att="INTEGER", def=210 },   					 
								qbackgroundtopcolor2={name="udqbackgroundtopcolor2",title="Background G",att="INTEGER", def=230 },
								qbackgroundtopcolor3={name="udqbackgroundtopcolor3",title="Background B",att="INTEGER", def=230 },
								
								qbackgroundbotcolor1={name="udqbackgroundbotcolor1",title="Background R",att="INTEGER", def=255 },
								qbackgroundbotcolor2={name="udqbackgroundbotcolor2",title="Background G",att="INTEGER", def=255 },
								qbackgroundbotcolor3={name="udqbackgroundbotcolor3",title="Background B",att="INTEGER", def=255 },
								
								abackgroundtopcolor1={name="udabackgroundtopcolor1",title="Background R",att="INTEGER", def=255 },   					 
								abackgroundtopcolor2={name="udabackgroundtopcolor2",title="Background G",att="INTEGER", def=255 },
								abackgroundtopcolor3={name="udabackgroundtopcolor3",title="Background B",att="INTEGER", def=255 },
								
								abackgroundbotcolor1={name="udabackgroundbotcolor1",title="Background R",att="INTEGER", def=200 },
								abackgroundbotcolor2={name="udabackgroundbotcolor2",title="Background G",att="INTEGER", def=200 },
								abackgroundbotcolor3={name="udabackgroundbotcolor3",title="Background B",att="INTEGER", def=200 },

								qfontsize={name="udquestionfontsize",title="Question Font Size",att="INTEGER", def=18,min=6,max=60},
								afontsize={name="udanswerfontsize",title="Answer Font Size",att="INTEGER", def=18,min=6,max=60},
								
								qboxcolor1={name="udqboxcolor1",title="Box Color R",att="INTEGER", def=255 },
								qboxcolor2={name="udqboxcolor2",title="Box Color G",att="INTEGER", def=255 },
								qboxcolor3={name="udqboxcolor3",title="Box Color B",att="INTEGER", def=255 },
								
								aboxcolor1={name="udaboxcolor1",title="Box Color R",att="INTEGER", def=255 },
								aboxcolor2={name="udaboxcolor2",title="Box Color G",att="INTEGER", def=255 },
								aboxcolor3={name="udaboxcolor3",title="Box Color B",att="INTEGER", def=255 },
								
								qincludetextbox={name="udqincludetextbox",title="Show Box",att="INTEGER", def=0},
								aincludetextbox={name="udaincludetextbox",title="Show Box",att="INTEGER", def=0},
																								
							},


					},
	         OJ = {   
					table = "tblOBJECT",
					key= "objectid",
					keyatt = "INTEGER PRIMARY KEY AUTOINCREMENT",
					indexes = {
					           objectindex1 = "objectownerid,objectownername,objectownersubid",
					          },
					fields= {
								ownername = {name="objectownername",att="TEXT" ,title="Date Recycled",notes="Will be table name of owner",copyonshare=true },
								ownerid = {name="objectownerid",att="INTEGER",title="Date Recycled" ,copyonshare=false },
								ownersubid = {name="objectownersubid",att="INTEGER" ,title="Date Recycled",copyonshare=true },
								suffix = {name="objectsuffix",att="TEXT" ,title="Suffix",copyonshare=true },
								theobject={name="objectobject",att="OBJECT",title="Date Recycled",copyonshare=false },
								},
					},
	         QS = {   
					table = "tblQUES",
					key= "quesid",
					orderby = "quessortorder",
					keyatt = "INTEGER PRIMARY KEY AUTOINCREMENT ",
					indexes = {
					           quesindex1 = "queslesid",
					          },
					parentid = "queslesid",
					fields= {
							    lesid = {name="queslesid",title="queslesid",att="INTEGER"},  --parent
							    questiontype = {name="questype",title="Type",att="INTEGER",valuetabledef="quesans",valuetable="types",editmsg="Select Question Type from list below",eventname="refreshquestion",copyonshare=true },
								title = {name="questitle",title="Title",att="TEXT DEFAULT 'Question Title'",copyonshare=true },
								question = {name="quesquestion",title="Question",att="TEXT DEFAULT ''",copyonshare=true },
								questionlanguage = {name="quesquestionlng",title="Lang",att="TEXT DEFAULT 'en'",valuetable="languages",editmsg="Select Language from list below",copyonshare=true },
								-----------------------------------------------------------------------------------
								answershowquestion = {name="quesanswershowquestion",title="Show Text From Question",att="INTEGER DEFAULT 0",eventname="refreshquestion" ,copyonshare=true },   -- text to display on asnswer screen
								answer = {name="quesanswer",title="Answer",att="TEXT DEFAULT ''" ,copyonshare=true },   -- text to display on asnswer screen
								answerlanguage = {name="quesanswerlng",title="Lang",att="TEXT DEFAULT 'en'",valuetable="languages",editmsg="Select Language from list below",copyonshare=true },
								answerpicownersubid = {name="quesanswerpicownersubid",title="Show Picture From Question",att="INTEGER DEFAULT 0",eventname="refreshquestion" ,copyonshare=true },   -- text to display on asnswer screen
								--======================================
								--== correctanswer is a json string
								--======================================
								correctanswer = {name="quescorrectanswer",title="Correct Answer",att="TEXT" ,copyonshare=true },
								added = {name="quesadded",title="Date Added",att="INTEGER"},
								updated = {name="quesupdated",title="Date Updated",att="INTEGER"},
								sortorder = {name="quessortorder",title="Order",att="TEXT",copyonshare=true },
							},


											
				   }	,
 		    LS = {   
					table = "tblLES",
					key= "lesid",
					keyatt = "INTEGER PRIMARY KEY AUTOINCREMENT ",
					displayfield = "lestitle",
				    orderby = "lestitle",
					parentid = "lesclsid",
					fields= {
							    clsid = {name="lesclsid",title="Class",att="INTEGER",parenttable="CS",eventname="refreshlessonlist"},  --parent
								title = {name="lestitle",title="Title",att="TEXT DEFAULT 'Lesson Title'",copyonshare=true },
								desc = {name="lesdesc",title="Description",att="TEXT DEFAULT 'Add Description'",copyonshare=true },
								added = {name="lesadded",title="Date Added",att="INTEGER"},
								updated = {name="lesupdated",title="Date Updated",att="INTEGER"},
								recycled = {name="lesrecycled",title="Date Recycled",att="INTEGER"},
								hidefromstudy = {name="leshidefromstudy",title="Hide From The Study List",att="INTEGER DEFAULT 0"},
						},

				   }	,
 		    ST = {   
					table = "tblSTUDY",
					key= "studyid",
					keyatt = "INTEGER PRIMARY KEY AUTOINCREMENT ",
					indexes = {
					           studyindex1 = "studylesid",
					          },
				    orderby = "studyadded desc",
					parentid = "studylesid",
					displayfield = "studyadded",
					title = "Study",
					group = "Study",
					image = "assets/studystudy.png",
					fields= {
							    lesid = {name="studylesid",title="Lesson",att="INTEGER",parenttable="LS" },  --parent
								added = {name="studyadded",title="Date Added",att="INTEGER"},
								questioncount = {name="studyquestioncount",title="Question Count",att="INTEGER"},
								lessonversion = {name="studylessonversion",title="Lesson Version",att="INTEGER"},  -- the updated column stamp of the lesson
							},

				   }	,
 		    SA = {   
					table = "tblSTUDYANSWER",
					key= "studyanswerid",
					keyatt = "INTEGER PRIMARY KEY AUTOINCREMENT ",
					includeonshare = false,
					indexes = {
					           studyanswerindex1 = "studyanswerstudyid",
					           studyanswerindex2 = "studyanswerquesid",
					          },
				    orderby = "",
					parentid = "studyanswerstudyid",
					title = "Study Answer",
					group = "Study Answer",
					image = "assets/studystudy.png",
					fields= {
							    studyid = {name="studyanswerstudyid",title="Study",att="INTEGER",parenttable="ST" },  --parent
							    quesid = {name="studyanswerquesid",title="Study",att="INTEGER",parenttable="QS" },  --parent
							    questiontype = {name="studyanswerquestype",title="Type",att="INTEGER"},
								questionversion = {name="studyanswerquestionversion",title="Question Version",att="INTEGER"},  -- the updated column stamp of the question
								correctanswer = {name="studyanswercorrectanswer",title="Correct Answer",att="TEXT" },
								youranswer = {name="studyansweryouranswer",title="Your Answer",att="TEXT" },
							    answeredcorrectly = {name="studyansweredcorrectly",title="Answered Correctly",att="INTEGER" },  --1 if true 0 if false nil if not answered
							},


				   }	,

		  	 CS = {   
					table = "tblCLS",
					key= "clsid",
					keyatt = "INTEGER PRIMARY KEY AUTOINCREMENT ",
					includeonshare = false,
					orderby = "clstitle",
					displayfield = "clstitle",
					parentid = "clsschid",
					title = "Class",
					group = "Classes",
					editmsg="Select SETUP to add, modify or delete Classes",
					image = "assets/class.png",
					fields= {
								schid = {name="clsschid",title="clsschid",att="INTEGER",parenttable="SC"},   --parent
								title = {name="clstitle",title="Title",att="TEXT DEFAULT 'Class Title'",eventname="refreshclasslist",},
								desc = {name="clsdesc",title="Description",att="TEXT DEFAULT ''"},
								added = {name="clsadded",title="Date Added",att="INTEGER"},
								updated = {name="clsupdated",title="Date Updated",att="INTEGER"},
								},


					}	,	  
	         SC = {   
					table = "tblSCH",
					key= "schid",
					keyatt = "INTEGER PRIMARY KEY AUTOINCREMENT ",
					includeonshare = false,
					displayfield = "schtitle",
				    orderby = "schtitle",
					title = "School",
					fields= {
								title = {name="schtitle",title="Title",att="TEXT DEFAULT 'School Name'" },
								desc = {name="schdesc",title="Description",att="TEXT DEFAULT 'School Desc'" },
							},
				   }	,
			   } 


return M