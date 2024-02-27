{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/atarist-tools)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Program ST2UNI;

Const
 AtariSTtoUTF32:Array[#0..#255]of Word=(
  {00} $0000,{01} $0001,{02} $0002,{03} $0003,
  {04} $0004,{05} $0005,{06} $0006,{07} $0007,
  {08} $0008,{09} $0009,{0A} $000A,{0B} $000B,
  {0C} $000C,{0D} $000D,{0E} $000E,{0F} $000F,
  {10} $0010,{11} $0011,{12} $0012,{13} $0013,
  {14} $0014,{15} $0015,{16} $0016,{17} $0017,
  {18} $0018,{19} $0019,{1A} $001A,{1B} $001B,
  {1C} $001C,{1D} $001D,{1E} $001E,{1F} $001F,
  {20} $0020,{21} $0021,{22} $0022,{23} $0023,
  {24} $0024,{25} $0025,{26} $0026,{27} $0027,
  {28} $0028,{29} $0029,{2A} $002A,{2B} $002B,
  {2C} $002C,{2D} $002D,{2E} $002E,{2F} $002F,
  {30} $0030,{31} $0031,{32} $0032,{33} $0033,
  {34} $0034,{35} $0035,{36} $0036,{37} $0037,
  {38} $0038,{39} $0039,{3A} $003A,{3B} $003B,
  {3C} $003C,{3D} $003D,{3E} $003E,{3F} $003F,
  {40} $0040,{41} $0041,{42} $0042,{43} $0043,
  {44} $0044,{45} $0045,{46} $0046,{47} $0047,
  {48} $0048,{49} $0049,{4A} $004A,{4B} $004B,
  {4C} $004C,{4D} $004D,{4E} $004E,{4F} $004F,
  {50} $0050,{51} $0051,{52} $0052,{53} $0053,
  {54} $0054,{55} $0055,{56} $0056,{57} $0057,
  {58} $0058,{59} $0059,{5A} $005A,{5B} $005B,
  {5C} $005C,{5D} $005D,{5E} $005E,{5F} $005F,
  {60} $0060,{61} $0061,{62} $0062,{63} $0063,
  {64} $0064,{65} $0065,{66} $0066,{67} $0067,
  {68} $0068,{69} $0069,{6A} $006A,{6B} $006B,
  {6C} $006C,{6D} $006D,{6E} $006E,{6F} $006F,
  {70} $0070,{71} $0071,{72} $0072,{73} $0073,
  {74} $0074,{75} $0075,{76} $0076,{77} $0077,
  {78} $0078,{79} $0079,{7A} $007A,{7B} $007B,
  {7C} $007C,{7D} $007D,{7E} $007E,{7F} $007F,
  {80} $00C7,{81} $00FC,{82} $00E9,{83} $00E2,
  {84} $00E4,{85} $00E0,{86} $00E5,{87} $00E7,
  {88} $00EA,{89} $00EB,{8A} $00E8,{8B} $00EF,
  {8C} $00EE,{8D} $00EC,{8E} $00C4,{8F} $00C5,
  {90} $00C9,{91} $00E6,{92} $00C6,{93} $00F4,
  {94} $00F6,{95} $00F2,{96} $00FB,{97} $00F9,
  {98} $00FF,{99} $00D6,{9A} $00DC,{9B} $00A2,
  {9C} $00A3,{9D} $00A5,{9E} $03B2,{9F} $0192,
  {A0} $00E1,{A1} $00ED,{A2} $00F3,{A3} $00FA,
  {A4} $00F1,{A5} $00D1,{A6} $00AA,{A7} $00BA,
  {A8} $00BF,{A9} $2310,{AA} $00AC,{AB} $00BD,
  {AC} $00BC,{AD} $00A1,{AE} $00AB,{AF} $00BB,
  {B0} $00E3,{B1} $00F5,{B2} $00D8,{B3} $00F8,
  {B4} $0153,{B5} $0152,{B6} $00C0,{B7} $00C3,
  {B8} $00D5,{B9} $00A8,{BA} $00B4,{BB} $2020,
  {BC} $00B6,{BD} $00A9,{BE} $00AE,{BF} $2122,
  {C0} $0133,{C1} $0132,{C2} $05D0,{C3} $05D1,
  {C4} $05D2,{C5} $05D3,{C6} $05D4,{C7} $05D5,
  {C8} $05D6,{C9} $05D7,{CA} $05D8,{CB} $05D9,
  {CC} $05DB,{CD} $05DC,{CE} $05DE,{CF} $05E0,
  {D0} $05E1,{D1} $05E2,{D2} $05E4,{D3} $05E6,
  {D4} $05E7,{D5} $05E8,{D6} $05E9,{D7} $05EA,
  {D8} $05DF,{D9} $05DA,{DA} $05DD,{DB} $05E3,
  {DC} $05E5,{DD} $00A7,{DE} $2227,{DF} $221E,
  {E0} $03B1,{E1} $00DF,{E2} $0393,{E3} $03C0,
  {E4} $03A3,{E5} $03C3,{E6} $00B5,{E7} $03C4,
  {E8} $03A6,{E9} $0398,{EA} $03A9,{EB} $03B4,
  {EC} $222E,{ED} $03C6,{EE} $03B5,{EF} $2229,
  {F0} $2261,{F1} $00B1,{F2} $2265,{F3} $2264,
  {F4} $2320,{F5} $2321,{F6} $00F7,{F7} $2248,
  {F8} $00B0,{F9} $2219,{FA} $00B7,{FB} $221A,
  {FC} $207F,{FD} $00B2,{FE} $22B3,{FF} $00AF
);

Var
 FileInput:Text;
 I:Integer;
 CurrLine:String;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('ST2UNI - Cette commande permet de convertir un texte de format ',
                    'Atari ST en texte Unicode.');
  WriteLn;
  WriteLn('Syntaxe: ST2UNI [/?] [fichier]');
  WriteLn;
  WriteLn(' fichier        Indique le nom du fichier … traiter');
 End
  Else
 If ParamCount=0Then Begin
  ReadLn(CurrLine);
  For I:=1 to Length(CurrLine)do Begin
   Write(Char(Lo(AtariSTtoUTF32[CurrLine[I]])));
   Write(Char(Hi(AtariSTtoUTF32[CurrLine[I]])));
  End;
 End
  Else
 Begin
  {$I-}Assign(FileInput,ParamStr(1));
  Reset(FileInput);{$I+}
  If IOResult<>0 Then Begin
   WriteLn('Erreur de lecture du fichier ',ParamStr(1));
   Halt(1);
  End;
  While Not EOF(FileInput)do Begin
   ReadLn(FileInput,CurrLine);
   For I:=1 to Length(CurrLine)do Begin
    Write(Char(Lo(AtariSTtoUTF32[CurrLine[I]])));
    Write(Char(Hi(AtariSTtoUTF32[CurrLine[I]])));
   End;
  End;
 End;
END.