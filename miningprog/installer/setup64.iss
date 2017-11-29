; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Carpe Crypto Miner"
#define MyAppVersion "0.2"
#define MyAppPublisher "CarpeCrypto"
#define MyAppURL "http://carpecrypto.me"
#define MyAppExeName "cmm64.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{FB27AE50-B0A5-488B-9997-BE9F106402BA}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
PrivilegesRequired=admin
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=CarpeCryptoMiner-64
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; OnlyBelowVersion: 0,6.1

[Files]
Source: "C:\Users\charl\Desktop\Carpe\carpecrypto\miningprog\installer\cmm64.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\charl\Desktop\Carpe\carpecrypto\miningprog\installer\cmm64.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\config.txt"; DestDir: "{app}"; Flags: ignoreversion external
Source: "C:\Users\charl\Desktop\Carpe\carpecrypto\miningprog\installer\msvcr110.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\cmm64.ico"; Tasks: desktopicon
Name: "{commonstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\cmm64.ico"

[Code]
Var
  Page: TInputQueryWizardPage;
  address: String;
  
procedure InitializeWizard();
BEGIN
  // Create the page
  Page := CreateInputQueryPage(wpWelcome,
    'XMR Address', 'Monero Wallet',
    'Please enter your Monero Wallet Address. PLEASE NOTE: It is case sensitive!');
  // Add items (False means it's not a password edit)
  Page.Add('XMR Wallet Address:', False);
  // Set initial values (optional)
  Page.Values[0] := ExpandConstant('43FeFPuaspxAEU7ZGEY93YBmG8nkA1x1Pgg5kTh7mYuLXCzMP3hERey6QBdKKBciuqhsakJD44bGHhJX98V3VjbZ9r1LKzx');
END;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if(CurPageID = Page.ID) then
  begin
    // Process the page
    // Read values into variables
    address := Page.Values[0];
    SaveStringToFile('c:\config.txt', '-o stratum+tcp://pool.carpecrypto.me:3333'#13#10+'-u '+address+#13#10+'-p x'+#13#10+'-nofee 1', False);
  end;

 Result := True;
end;
[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
