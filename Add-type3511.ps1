$User32 = @"
using System;
using System.Runtime.InteropServices;
public class User32 {
[DllImport("user32.dll", CharSet=CharSet.Auto)] public static extern int MessageBox(IntPtr hWnd, String text, String caption, int options);
[DllImport("advapi32.dll", SetLastError = true)]public static extern bool GetUserName(System.Text.StringBuilder sb, ref Int32 length);
}
"@
Add-Type $User32
$name_len = 64
$user_name = New-Object System.Text.StringBuilder -Argumentlist $name_len
[User32]::GetUserName($user_name, [ref]$name_len)
[User32]::MessageBox(0, $user_name, "MyBox", 0)