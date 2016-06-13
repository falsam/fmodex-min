#FMOD_INIT_NORMAL = $0
#FMOD_CREATESTREAM = $80

CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
  Global fmodLib = OpenLibrary(#PB_Any, "fmodex.dll")
CompilerElse
  Global fmodLib = OpenLibrary(#PB_Any, "fmodex64.dll")
CompilerEndIf

If fmodLib
  
  ;// Declare prototype
  
  ;- FMOD_System_Create
  Prototype.l FMOD_System_Create_Prototype(*system)
  Global FMOD_System_Create.FMOD_System_Create_Prototype = GetFunction(fmodLib, "FMOD_System_Create")
  
  ;- FMOD_System_Init_
  Prototype.l FMOD_System_Init_Prototype (system.l, Maxchannels.l, flags.l, Extradriverdata.l);system.l, Maxchannels.l, flags.l, Extradriverdata.l
  Global FMOD_System_Init.FMOD_System_Init_Prototype = GetFunction(fmodLib, "FMOD_System_Init")
  
  ;- FMOD_System_CreateStream_
  Prototype.l FMOD_System_CreateStream_Prototype (system.l, Name_or_data.l, Mode.l, *exinfo, *Sound)
  Global FMOD_System_CreateStream.FMOD_System_CreateStream_Prototype = GetFunction(fmodLib, "FMOD_System_CreateStream")
  
  ;- FMOD_System_PlaySound_
  Prototype.l FMOD_System_PlaySound_Prototype (system.l, channelid.l, sound.l, paused.l, *channel)
  Global FMOD_System_PlaySound.FMOD_System_PlaySound_Prototype = GetFunction(fmodLib, "FMOD_System_PlaySound")
  
  
  ;// Test
  Global fmodsystem, url.S, Sound, Channel.i
  
  FMOD_System_Create(@fmodsystem)
  
  FMOD_System_Init(fmodsystem, 32, #FMOD_INIT_NORMAL, 0)
  
  Url ="http://server1.chilltrax.com:9000"
  FMOD_System_CreateStream(fmodsystem, @Url, #FMOD_CREATESTREAM, 0, @sound)
  
  FMOD_System_PlaySound(fmodsystem, 1, sound, 0, @channel)
  
  Delay(10000)
EndIf


; IDE Options = PureBasic 5.42 LTS (Windows - x86)
; CursorPosition = 44
; FirstLine = 1
; Folding = -
; EnableXP