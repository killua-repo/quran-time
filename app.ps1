Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Quran Time WinTool"
        Height="860"
        Width="1380"
        MinHeight="760"
        MinWidth="1180"
        WindowStartupLocation="CenterScreen"
        ResizeMode="CanResize"
        WindowStyle="None"
        Background="#0B0F17"
        Foreground="#E5E7EB"
        FontFamily="Segoe UI">

    <Window.Resources>
        <SolidColorBrush x:Key="MainBg" Color="#0B0F17"/>
        <SolidColorBrush x:Key="PanelBg" Color="#111827"/>
        <SolidColorBrush x:Key="PanelBg2" Color="#0F172A"/>
        <SolidColorBrush x:Key="PanelBg3" Color="#0B1220"/>
        <SolidColorBrush x:Key="BorderColor" Color="#334155"/>
        <SolidColorBrush x:Key="TextMain" Color="#E5E7EB"/>
        <SolidColorBrush x:Key="TextMuted" Color="#94A3B8"/>
        <SolidColorBrush x:Key="Accent" Color="#2563EB"/>
        <SolidColorBrush x:Key="AccentHover" Color="#3B82F6"/>
        <SolidColorBrush x:Key="Danger" Color="#DC2626"/>
        <SolidColorBrush x:Key="Success" Color="#059669"/>

        <Style x:Key="TopButton" TargetType="Button">
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
            <Setter Property="Background" Value="{DynamicResource PanelBg2}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource BorderColor}"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Padding" Value="16,9"/>
            <Setter Property="Margin" Value="0,0,8,0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="FontSize" Value="13"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="MinWidth" Value="110"/>
        </Style>

        <Style x:Key="PrimaryButton" TargetType="Button">
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="Background" Value="{DynamicResource Accent}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource Accent}"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Padding" Value="14,10"/>
            <Setter Property="Margin" Value="0,0,10,10"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="MinWidth" Value="180"/>
            <Setter Property="MinHeight" Value="38"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
        </Style>

        <Style x:Key="GhostButton" TargetType="Button">
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
            <Setter Property="Background" Value="{DynamicResource PanelBg2}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource BorderColor}"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Padding" Value="14,10"/>
            <Setter Property="Margin" Value="0,0,10,10"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="MinWidth" Value="180"/>
            <Setter Property="MinHeight" Value="38"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
        </Style>

        <Style x:Key="CardBorder" TargetType="Border">
            <Setter Property="Background" Value="{DynamicResource PanelBg}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource BorderColor}"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="CornerRadius" Value="14"/>
            <Setter Property="Padding" Value="16"/>
            <Setter Property="Margin" Value="0,0,0,14"/>
        </Style>

        <Style x:Key="SectionTitle" TargetType="TextBlock">
            <Setter Property="FontSize" Value="20"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
        </Style>

        <Style x:Key="MutedText" TargetType="TextBlock">
            <Setter Property="Foreground" Value="{DynamicResource TextMuted}"/>
        </Style>

        <Style x:Key="ListCheck" TargetType="CheckBox">
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
            <Setter Property="Margin" Value="0,0,0,8"/>
            <Setter Property="FontSize" Value="14"/>
        </Style>

        <Style x:Key="WinBtn" TargetType="Button">
            <Setter Property="Width" Value="42"/>
            <Setter Property="Height" Value="30"/>
            <Setter Property="Margin" Value="0,0,6,0"/>
            <Setter Property="Background" Value="{DynamicResource PanelBg2}"/>
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource BorderColor}"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="FontWeight" Value="Bold"/>
        </Style>
    </Window.Resources>

    <Border Background="{DynamicResource MainBg}" BorderBrush="{DynamicResource BorderColor}" BorderThickness="1" CornerRadius="16" Margin="10">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="60"/>
                <RowDefinition Height="62"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="220"/>
            </Grid.RowDefinitions>

            <!-- Custom Title Bar -->
            <Border Grid.Row="0" Background="{DynamicResource PanelBg3}" BorderBrush="{DynamicResource BorderColor}" BorderThickness="0,0,0,1">
                <Grid x:Name="DragBar" Margin="14,10,14,10">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="Auto"/>
                        <ColumnDefinition Width="*"/>
                        <ColumnDefinition Width="Auto"/>
                    </Grid.ColumnDefinitions>

                    <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                        <Border Width="34" Height="34" Background="{DynamicResource Accent}" CornerRadius="10" Margin="0,0,12,0">
                            <TextBlock Text="Q" HorizontalAlignment="Center" VerticalAlignment="Center" Foreground="White" FontWeight="Bold" FontSize="17"/>
                        </Border>
                        <StackPanel VerticalAlignment="Center">
                            <TextBlock x:Name="WindowTitleText" Text="Quran Time WinTool" FontSize="16" FontWeight="Bold" Foreground="{DynamicResource TextMain}"/>
                            <TextBlock Text="Portable PowerShell GUI" FontSize="11" Foreground="{DynamicResource TextMuted}"/>
                        </StackPanel>
                    </StackPanel>

                    <StackPanel Grid.Column="1" Orientation="Horizontal" HorizontalAlignment="Center" VerticalAlignment="Center">
                        <Border Background="#0A1C36" BorderBrush="#163A69" BorderThickness="1" CornerRadius="12" Padding="12,6">
                            <TextBlock Text="Dark UI" Foreground="#93C5FD" FontWeight="SemiBold"/>
                        </Border>
                    </StackPanel>

                    <StackPanel Grid.Column="2" Orientation="Horizontal" VerticalAlignment="Center">
                        <Button x:Name="BtnTheme" Style="{StaticResource WinBtn}" Content="☀"/>
                        <Button x:Name="BtnMin" Style="{StaticResource WinBtn}" Content="—"/>
                        <Button x:Name="BtnMax" Style="{StaticResource WinBtn}" Content="□"/>
                        <Button x:Name="BtnClose" Style="{StaticResource WinBtn}" Content="✕" Background="#3A1010" BorderBrush="#6B1D1D"/>
                    </StackPanel>
                </Grid>
            </Border>

            <!-- Top Tabs -->
            <Border Grid.Row="1" Background="{DynamicResource PanelBg}" BorderBrush="{DynamicResource BorderColor}" BorderThickness="0,0,0,1">
                <Grid Margin="14,10,14,10">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*"/>
                        <ColumnDefinition Width="260"/>
                    </Grid.ColumnDefinitions>

                    <StackPanel Orientation="Horizontal">
                        <Button x:Name="TabInstall" Style="{StaticResource TopButton}" Content="Install"/>
                        <Button x:Name="TabTweaks" Style="{StaticResource TopButton}" Content="Tweaks"/>
                        <Button x:Name="TabConfig" Style="{StaticResource TopButton}" Content="Config"/>
                        <Button x:Name="TabUpdates" Style="{StaticResource TopButton}" Content="Updates"/>
                        <Button x:Name="TabMicroWin" Style="{StaticResource TopButton}" Content="MicroWin"/>
                    </StackPanel>

                    <TextBox x:Name="SearchBox"
                             Grid.Column="1"
                             Height="38"
                             VerticalAlignment="Center"
                             Background="{DynamicResource PanelBg2}"
                             Foreground="{DynamicResource TextMain}"
                             BorderBrush="{DynamicResource BorderColor}"
                             BorderThickness="1"
                             Padding="12,8"
                             Text="Search or command..."
                             FontSize="13"/>
                </Grid>
            </Border>

            <!-- Main -->
            <Grid Grid.Row="2" Margin="14,14,14,10">
                <Grid.RowDefinitions>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="*"/>
                </Grid.RowDefinitions>

                <!-- Action Row -->
                <WrapPanel Grid.Row="0" Margin="0,0,0,12">
                    <TextBlock Text="Recommended Selections:" VerticalAlignment="Center" Margin="0,0,12,0" Foreground="#60A5FA" FontSize="14"/>
                    <Button x:Name="BtnStandard" Style="{StaticResource PrimaryButton}" Content="Standard"/>
                    <Button x:Name="BtnMinimal" Style="{StaticResource GhostButton}" Content="Minimal"/>
                    <Button x:Name="BtnClear" Style="{StaticResource GhostButton}" Content="Clear"/>
                    <Button x:Name="BtnGetInstalled" Style="{StaticResource GhostButton}" Content="Get Installed"/>
                    <Button x:Name="BtnRename" Style="{StaticResource GhostButton}" Content="Change Title"/>
                </WrapPanel>

                <!-- Content Grid -->
                <Grid Grid.Row="1">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="1.1*"/>
                        <ColumnDefinition Width="12"/>
                        <ColumnDefinition Width="0.9*"/>
                    </Grid.ColumnDefinitions>

                    <!-- Left -->
                    <Border Grid.Column="0" Style="{StaticResource CardBorder}">
                        <Grid>
                            <Grid.RowDefinitions>
                                <RowDefinition Height="Auto"/>
                                <RowDefinition Height="*"/>
                                <RowDefinition Height="Auto"/>
                            </Grid.RowDefinitions>

                            <StackPanel>
                                <TextBlock Text="Essential Tweaks" Style="{StaticResource SectionTitle}"/>
                                <TextBlock Text="Large checklist styled like Winutil." Style="{StaticResource MutedText}" Margin="0,6,0,12"/>
                            </StackPanel>

                            <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                                <StackPanel>
                                    <CheckBox x:Name="ChkRestorePoint" Style="{StaticResource ListCheck}" Content="Create Restore Point"/>
                                    <CheckBox x:Name="ChkDeleteTemp" Style="{StaticResource ListCheck}" Content="Delete Temporary Files"/>
                                    <CheckBox x:Name="ChkConsumer" Style="{StaticResource ListCheck}" Content="Disable Consumer Features"/>
                                    <CheckBox x:Name="ChkTelemetry" Style="{StaticResource ListCheck}" Content="Disable Telemetry"/>
                                    <CheckBox x:Name="ChkActivity" Style="{StaticResource ListCheck}" Content="Disable Activity History"/>
                                    <CheckBox x:Name="ChkExplorer" Style="{StaticResource ListCheck}" Content="Disable Explorer Automatic Folder Discovery"/>
                                    <CheckBox x:Name="ChkGameDVR" Style="{StaticResource ListCheck}" Content="Disable GameDVR"/>
                                    <CheckBox x:Name="ChkHibernation" Style="{StaticResource ListCheck}" Content="Disable Hibernation"/>
                                    <CheckBox x:Name="ChkHomegroup" Style="{StaticResource ListCheck}" Content="Disable Homegroup"/>
                                    <CheckBox x:Name="ChkLocation" Style="{StaticResource ListCheck}" Content="Disable Location Tracking"/>
                                    <CheckBox x:Name="ChkStorageSense" Style="{StaticResource ListCheck}" Content="Disable Storage Sense"/>
                                    <CheckBox x:Name="ChkWifiSense" Style="{StaticResource ListCheck}" Content="Disable Wifi-Sense"/>
                                    <CheckBox x:Name="ChkEndTask" Style="{StaticResource ListCheck}" Content="Enable End Task With Right Click"/>
                                    <CheckBox x:Name="ChkDiskCleanup" Style="{StaticResource ListCheck}" Content="Run Disk Cleanup"/>
                                    <CheckBox x:Name="ChkTerminal" Style="{StaticResource ListCheck}" Content="Change Windows Terminal Default"/>
                                    <CheckBox x:Name="ChkPS7Telemetry" Style="{StaticResource ListCheck}" Content="Disable PowerShell 7 Telemetry"/>
                                    <CheckBox x:Name="ChkRecall" Style="{StaticResource ListCheck}" Content="Disable Recall"/>
                                    <CheckBox x:Name="ChkHibernateDefault" Style="{StaticResource ListCheck}" Content="Set Hibernation as Default"/>
                                    <CheckBox x:Name="ChkServicesManual" Style="{StaticResource ListCheck}" Content="Set Services to Manual"/>
                                    <CheckBox x:Name="ChkDebloatEdge" Style="{StaticResource ListCheck}" Content="Debloat Edge"/>

                                    <TextBlock Text="Advanced Tweaks - Caution" Foreground="#60A5FA" FontSize="18" Margin="0,18,0,12"/>

                                    <CheckBox x:Name="ChkAdobeBlock" Style="{StaticResource ListCheck}" Content="Adobe Network Block"/>
                                    <CheckBox x:Name="ChkAdobeDebloat" Style="{StaticResource ListCheck}" Content="Adobe Debloat"/>
                                    <CheckBox x:Name="ChkIPv6" Style="{StaticResource ListCheck}" Content="Disable IPv6"/>
                                    <CheckBox x:Name="ChkPreferIPv4" Style="{StaticResource ListCheck}" Content="Prefer IPv4 over IPv6"/>
                                    <CheckBox x:Name="ChkTeredo" Style="{StaticResource ListCheck}" Content="Disable Teredo"/>
                                    <CheckBox x:Name="ChkBackgroundApps" Style="{StaticResource ListCheck}" Content="Disable Background Apps"/>
                                    <CheckBox x:Name="ChkFullscreen" Style="{StaticResource ListCheck}" Content="Disable Fullscreen Optimizations"/>
                                    <CheckBox x:Name="ChkCopilot" Style="{StaticResource ListCheck}" Content="Disable Microsoft Copilot"/>
                                    <CheckBox x:Name="ChkIntelLMS" Style="{StaticResource ListCheck}" Content="Disable Intel LMS"/>
                                    <CheckBox x:Name="ChkCalendar" Style="{StaticResource ListCheck}" Content="Disable Notification Tray Calendar"/>
                                    <CheckBox x:Name="ChkWPBT" Style="{StaticResource ListCheck}" Content="Disable Windows Platform Binary Table"/>
                                    <CheckBox x:Name="ChkDisplayPerf" Style="{StaticResource ListCheck}" Content="Set Display for Performance"/>
                                    <CheckBox x:Name="ChkMouseAccel" Style="{StaticResource ListCheck}" Content="Disable Mouse Acceleration"/>
                                    <CheckBox x:Name="ChkSticky" Style="{StaticResource ListCheck}" Content="Disable Sticky Keys"/>
                                    <CheckBox x:Name="ChkTaskbarCenter" Style="{StaticResource ListCheck}" Content="Center Taskbar Items"/>
                                    <CheckBox x:Name="ChkWidgets" Style="{StaticResource ListCheck}" Content="Disable Widgets Button"/>
                                    <CheckBox x:Name="ChkTaskView" Style="{StaticResource ListCheck}" Content="Disable Task View Button"/>
                                </StackPanel>
                            </ScrollViewer>

                            <WrapPanel Grid.Row="2" Margin="0,14,0,0">
                                <Button x:Name="BtnRunTweaks" Style="{StaticResource PrimaryButton}" Content="Run Tweaks"/>
                                <Button x:Name="BtnUndoTweaks" Style="{StaticResource GhostButton}" Content="Undo Selected Tweaks"/>
                            </WrapPanel>
                        </Grid>
                    </Border>

                    <!-- Right -->
                    <StackPanel Grid.Column="2">
                        <Border Style="{StaticResource CardBorder}">
                            <StackPanel>
                                <TextBlock Text="Customize Preferences" Style="{StaticResource SectionTitle}"/>
                                <TextBlock Text="Winutil-like preference panel." Style="{StaticResource MutedText}" Margin="0,6,0,12"/>

                                <CheckBox x:Name="PrefDarkWindows" Style="{StaticResource ListCheck}" Content="Dark Theme for Windows" IsChecked="True"/>
                                <CheckBox x:Name="PrefBingStart" Style="{StaticResource ListCheck}" Content="Bing Search in Start Menu" IsChecked="True"/>
                                <CheckBox x:Name="PrefNumLock" Style="{StaticResource ListCheck}" Content="NumLock on Startup" IsChecked="True"/>
                                <CheckBox x:Name="PrefVerbose" Style="{StaticResource ListCheck}" Content="Verbose Messages During Logon"/>
                                <CheckBox x:Name="PrefRecommend" Style="{StaticResource ListCheck}" Content="Recommendations in Start Menu" IsChecked="True"/>
                                <CheckBox x:Name="PrefSettingsHome" Style="{StaticResource ListCheck}" Content="Remove Settings Home Page"/>
                                <CheckBox x:Name="PrefSnap" Style="{StaticResource ListCheck}" Content="Snap Window" IsChecked="True"/>
                                <CheckBox x:Name="PrefSnapAssist" Style="{StaticResource ListCheck}" Content="Snap Assist Flyout" IsChecked="True"/>
                                <CheckBox x:Name="PrefSnapSuggest" Style="{StaticResource ListCheck}" Content="Snap Assist Suggestion" IsChecked="True"/>
                                <CheckBox x:Name="PrefMouseAccel" Style="{StaticResource ListCheck}" Content="Mouse Acceleration"/>
                                <CheckBox x:Name="PrefSticky" Style="{StaticResource ListCheck}" Content="Sticky Keys"/>
                                <CheckBox x:Name="PrefHiddenFiles" Style="{StaticResource ListCheck}" Content="Show Hidden Files" IsChecked="True"/>
                                <CheckBox x:Name="PrefExtensions" Style="{StaticResource ListCheck}" Content="Show File Extensions" IsChecked="True"/>
                                <CheckBox x:Name="PrefSearchBtn" Style="{StaticResource ListCheck}" Content="Search Button in Taskbar" IsChecked="True"/>
                                <CheckBox x:Name="PrefTaskViewBtn" Style="{StaticResource ListCheck}" Content="Task View Button in Taskbar"/>
                                <CheckBox x:Name="PrefCenterTaskbar" Style="{StaticResource ListCheck}" Content="Center Taskbar Items"/>
                                <CheckBox x:Name="PrefWidgetsBtn" Style="{StaticResource ListCheck}" Content="Widgets Button in Taskbar"/>
                                <CheckBox x:Name="PrefBsod" Style="{StaticResource ListCheck}" Content="Detailed BSoD"/>
                            </StackPanel>
                        </Border>

                        <Border Style="{StaticResource CardBorder}">
                            <StackPanel>
                                <TextBlock Text="Performance Plans" Style="{StaticResource SectionTitle}"/>
                                <TextBlock Text="Buttons for testing commands." Style="{StaticResource MutedText}" Margin="0,6,0,12"/>
                                <Button x:Name="BtnUltimateOn" Style="{StaticResource PrimaryButton}" Content="Add and Activate Ultimate Performance"/>
                                <Button x:Name="BtnUltimateOff" Style="{StaticResource GhostButton}" Content="Remove Ultimate Performance"/>
                                <Button x:Name="BtnOpenTemp" Style="{StaticResource GhostButton}" Content="Open Temp Folder"/>
                                <Button x:Name="BtnWingetList" Style="{StaticResource GhostButton}" Content="Winget List"/>
                                <Button x:Name="BtnSysInfo" Style="{StaticResource GhostButton}" Content="System Info"/>
                            </StackPanel>
                        </Border>

                        <Border Style="{StaticResource CardBorder}">
                            <StackPanel>
                                <TextBlock Text="Window Details" Style="{StaticResource SectionTitle}"/>
                                <TextBlock x:Name="CurrentTitle" Text="Current Title: Quran Time WinTool" Margin="0,12,0,6" Foreground="{DynamicResource TextMain}"/>
                                <TextBlock x:Name="ThemeStatus" Text="Theme: Dark" Foreground="{DynamicResource TextMuted}"/>
                            </StackPanel>
                        </Border>
                    </StackPanel>
                </Grid>
            </Grid>

            <!-- Log -->
            <Border Grid.Row="3" Margin="14,0,14,14" Background="{DynamicResource PanelBg3}" BorderBrush="{DynamicResource BorderColor}" BorderThickness="1" CornerRadius="14" Padding="14">
                <Grid>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <Grid Margin="0,0,0,10">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="Auto"/>
                        </Grid.ColumnDefinitions>

                        <StackPanel>
                            <TextBlock Text="Output Log" FontSize="18" FontWeight="Bold" Foreground="{DynamicResource TextMain}"/>
                            <TextBlock Text="This area shows actions and command output." Foreground="{DynamicResource TextMuted}" FontSize="12"/>
                        </StackPanel>

                        <Button x:Name="BtnClearLog"
                                Grid.Column="1"
                                Width="90"
                                Height="34"
                                Background="{DynamicResource PanelBg2}"
                                Foreground="{DynamicResource TextMain}"
                                BorderBrush="{DynamicResource BorderColor}"
                                BorderThickness="1"
                                Cursor="Hand"
                                Content="Clear"/>
                    </Grid>

                    <TextBox x:Name="LogBox"
                             Grid.Row="1"
                             Background="#020617"
                             Foreground="#BBF7D0"
                             BorderBrush="{DynamicResource BorderColor}"
                             BorderThickness="1"
                             FontFamily="Consolas"
                             FontSize="13"
                             Padding="12"
                             AcceptsReturn="True"
                             TextWrapping="Wrap"
                             IsReadOnly="True"
                             VerticalScrollBarVisibility="Auto"/>
                </Grid>
            </Border>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$names = @(
    "DragBar","WindowTitleText","BtnTheme","BtnMin","BtnMax","BtnClose",
    "TabInstall","TabTweaks","TabConfig","TabUpdates","TabMicroWin",
    "SearchBox","BtnStandard","BtnMinimal","BtnClear","BtnGetInstalled","BtnRename",
    "BtnRunTweaks","BtnUndoTweaks","BtnUltimateOn","BtnUltimateOff","BtnOpenTemp","BtnWingetList","BtnSysInfo",
    "CurrentTitle","ThemeStatus","BtnClearLog","LogBox",
    "ChkRestorePoint","ChkDeleteTemp","ChkConsumer","ChkTelemetry","ChkActivity","ChkExplorer","ChkGameDVR",
    "ChkHibernation","ChkHomegroup","ChkLocation","ChkStorageSense","ChkWifiSense","ChkEndTask","ChkDiskCleanup",
    "ChkTerminal","ChkPS7Telemetry","ChkRecall","ChkHibernateDefault","ChkServicesManual","ChkDebloatEdge",
    "ChkAdobeBlock","ChkAdobeDebloat","ChkIPv6","ChkPreferIPv4","ChkTeredo","ChkBackgroundApps","ChkFullscreen",
    "ChkCopilot","ChkIntelLMS","ChkCalendar","ChkWPBT","ChkDisplayPerf","ChkMouseAccel","ChkSticky","ChkTaskbarCenter","ChkWidgets","ChkTaskView"
)

foreach ($name in $names) {
    Set-Variable -Name $name -Value $window.FindName($name) -Scope Script
}

$script:IsDark = $true
$script:IsMax = $false

function Write-Log {
    param([string]$Message)
    $time = Get-Date -Format "HH:mm:ss"
    $script:LogBox.AppendText("[$time] $Message`r`n")
    $script:LogBox.ScrollToEnd()
}

function Update-Title {
    $script:WindowTitleText.Text = $window.Title
    $script:CurrentTitle.Text = "Current Title: $($window.Title)"
}

function Set-DarkTheme {
    $window.Resources["MainBg"]      = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#0B0F17"))
    $window.Resources["PanelBg"]     = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#111827"))
    $window.Resources["PanelBg2"]    = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#0F172A"))
    $window.Resources["PanelBg3"]    = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#0B1220"))
    $window.Resources["BorderColor"] = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#334155"))
    $window.Resources["TextMain"]    = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#E5E7EB"))
    $window.Resources["TextMuted"]   = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#94A3B8"))
    $script:ThemeStatus.Text = "Theme: Dark"
    $script:BtnTheme.Content = "☀"
    $script:IsDark = $true
    Write-Log "Dark theme enabled."
}

function Set-LightTheme {
    $window.Resources["MainBg"]      = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#F1F5F9"))
    $window.Resources["PanelBg"]     = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#FFFFFF"))
    $window.Resources["PanelBg2"]    = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#E2E8F0"))
    $window.Resources["PanelBg3"]    = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#E5E7EB"))
    $window.Resources["BorderColor"] = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#CBD5E1"))
    $window.Resources["TextMain"]    = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#0F172A"))
    $window.Resources["TextMuted"]   = New-Object System.Windows.Media.SolidColorBrush ([System.Windows.Media.ColorConverter]::ConvertFromString("#475569"))
    $script:ThemeStatus.Text = "Theme: Light"
    $script:BtnTheme.Content = "☾"
    $script:IsDark = $false
    Write-Log "Light theme enabled."
}

function Get-CheckedTweaks {
    $selected = @()
    $map = @{
        "ChkRestorePoint"   = "Create Restore Point"
        "ChkDeleteTemp"     = "Delete Temporary Files"
        "ChkConsumer"       = "Disable Consumer Features"
        "ChkTelemetry"      = "Disable Telemetry"
        "ChkActivity"       = "Disable Activity History"
        "ChkExplorer"       = "Disable Explorer Automatic Folder Discovery"
        "ChkGameDVR"        = "Disable GameDVR"
        "ChkHibernation"    = "Disable Hibernation"
        "ChkHomegroup"      = "Disable Homegroup"
        "ChkLocation"       = "Disable Location Tracking"
        "ChkStorageSense"   = "Disable Storage Sense"
        "ChkWifiSense"      = "Disable Wifi-Sense"
        "ChkEndTask"        = "Enable End Task With Right Click"
        "ChkDiskCleanup"    = "Run Disk Cleanup"
        "ChkTerminal"       = "Change Terminal Default"
        "ChkPS7Telemetry"   = "Disable PowerShell 7 Telemetry"
        "ChkRecall"         = "Disable Recall"
        "ChkHibernateDefault" = "Set Hibernation as Default"
        "ChkServicesManual" = "Set Services to Manual"
        "ChkDebloatEdge"    = "Debloat Edge"
        "ChkAdobeBlock"     = "Adobe Network Block"
        "ChkAdobeDebloat"   = "Adobe Debloat"
        "ChkIPv6"           = "Disable IPv6"
        "ChkPreferIPv4"     = "Prefer IPv4 over IPv6"
        "ChkTeredo"         = "Disable Teredo"
        "ChkBackgroundApps" = "Disable Background Apps"
        "ChkFullscreen"     = "Disable Fullscreen Optimizations"
        "ChkCopilot"        = "Disable Microsoft Copilot"
        "ChkIntelLMS"       = "Disable Intel LMS"
        "ChkCalendar"       = "Disable Notification Tray Calendar"
        "ChkWPBT"           = "Disable Windows Platform Binary Table"
        "ChkDisplayPerf"    = "Set Display for Performance"
        "ChkMouseAccel"     = "Disable Mouse Acceleration"
        "ChkSticky"         = "Disable Sticky Keys"
        "ChkTaskbarCenter"  = "Center Taskbar Items"
        "ChkWidgets"        = "Disable Widgets Button"
        "ChkTaskView"       = "Disable Task View Button"
    }

    foreach ($key in $map.Keys) {
        $control = (Get-Variable -Name $key -Scope Script).Value
        if ($control.IsChecked) { $selected += $map[$key] }
    }

    return $selected
}

function Clear-AllTweaks {
    $allChecks = @(
        "ChkRestorePoint","ChkDeleteTemp","ChkConsumer","ChkTelemetry","ChkActivity","ChkExplorer","ChkGameDVR",
        "ChkHibernation","ChkHomegroup","ChkLocation","ChkStorageSense","ChkWifiSense","ChkEndTask","ChkDiskCleanup",
        "ChkTerminal","ChkPS7Telemetry","ChkRecall","ChkHibernateDefault","ChkServicesManual","ChkDebloatEdge",
        "ChkAdobeBlock","ChkAdobeDebloat","ChkIPv6","ChkPreferIPv4","ChkTeredo","ChkBackgroundApps","ChkFullscreen",
        "ChkCopilot","ChkIntelLMS","ChkCalendar","ChkWPBT","ChkDisplayPerf","ChkMouseAccel","ChkSticky","ChkTaskbarCenter","ChkWidgets","ChkTaskView"
    )

    foreach ($item in $allChecks) {
        (Get-Variable -Name $item -Scope Script).Value.IsChecked = $false
    }

    Write-Log "All tweak selections cleared."
}

function Run-PS {
    param([string]$Command)

    try {
        $result = Invoke-Expression $Command | Out-String
        if ($result.Trim()) {
            Write-Log $result.TrimEnd()
        } else {
            Write-Log "Command finished."
        }
    }
    catch {
        Write-Log $_.Exception.Message
    }
}

$window.Title = "Quran Time WinTool"
Update-Title
Write-Log "Custom Winutil-style window loaded."

$script:DragBar.Add_MouseLeftButtonDown({
    if ($_.ClickCount -eq 2) {
        if ($script:IsMax) {
            $window.WindowState = "Normal"
            $script:IsMax = $false
        } else {
            $window.WindowState = "Maximized"
            $script:IsMax = $true
        }
    } else {
        $window.DragMove()
    }
})

$script:BtnClose.Add_Click({ $window.Close() })
$script:BtnMin.Add_Click({ $window.WindowState = "Minimized" })
$script:BtnMax.Add_Click({
    if ($script:IsMax) {
        $window.WindowState = "Normal"
        $script:IsMax = $false
    } else {
        $window.WindowState = "Maximized"
        $script:IsMax = $true
    }
})

$script:BtnTheme.Add_Click({
    if ($script:IsDark) { Set-LightTheme } else { Set-DarkTheme }
})

$script:BtnRename.Add_Click({
    $window.Title = "Quran Time WinTool Pro"
    Update-Title
    Write-Log "Window title changed."
})

$script:TabInstall.Add_Click({ Write-Log "Install tab opened." })
$script:TabTweaks.Add_Click({ Write-Log "Tweaks tab opened." })
$script:TabConfig.Add_Click({ Write-Log "Config tab opened." })
$script:TabUpdates.Add_Click({ Write-Log "Updates tab opened." })
$script:TabMicroWin.Add_Click({ Write-Log "MicroWin tab opened." })

$script:BtnStandard.Add_Click({
    Clear-AllTweaks
    $script:ChkDeleteTemp.IsChecked = $true
    $script:ChkTelemetry.IsChecked = $true
    $script:ChkActivity.IsChecked = $true
    $script:ChkStorageSense.IsChecked = $true
    $script:ChkRecall.IsChecked = $true
    $script:ChkEndTask.IsChecked = $true
    $script:ChkDiskCleanup.IsChecked = $true
    Write-Log "Standard preset selected."
})

$script:BtnMinimal.Add_Click({
    Clear-AllTweaks
    $script:ChkDeleteTemp.IsChecked = $true
    $script:ChkTelemetry.IsChecked = $true
    Write-Log "Minimal preset selected."
})

$script:BtnClear.Add_Click({
    Clear-AllTweaks
})

$script:BtnGetInstalled.Add_Click({
    try {
        Write-Log "Installed apps sample:"
        $apps = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* -ErrorAction SilentlyContinue |
            Select-Object DisplayName |
            Where-Object { $_.DisplayName } |
            Select-Object -First 20
        foreach ($app in $apps) {
            Write-Log " - $($app.DisplayName)"
        }
    } catch {
        Write-Log $_.Exception.Message
    }
})

$script:BtnRunTweaks.Add_Click({
    $selected = Get-CheckedTweaks
    if ($selected.Count -eq 0) {
        Write-Log "No tweaks selected."
        return
    }

    Write-Log "Selected tweaks:"
    foreach ($item in $selected) {
        Write-Log " - $item"
    }

    Write-Log "Demo mode: real system-changing commands are not yet attached."
})

$script:BtnUndoTweaks.Add_Click({
    Write-Log "Undo mode clicked."
    Write-Log "Later we can map each tweak to rollback commands."
})

$script:BtnUltimateOn.Add_Click({
    Write-Log "Would run: powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61"
})

$script:BtnUltimateOff.Add_Click({
    Write-Log "Would remove custom ultimate performance profile."
})

$script:BtnOpenTemp.Add_Click({
    Start-Process $env:TEMP
    Write-Log "Temp folder opened."
})

$script:BtnWingetList.Add_Click({
    try {
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = "winget"
        $psi.Arguments = "list"
        $psi.RedirectStandardOutput = $true
        $psi.RedirectStandardError = $true
        $psi.UseShellExecute = $false
        $psi.CreateNoWindow = $true

        $p = New-Object System.Diagnostics.Process
        $p.StartInfo = $psi
        [void]$p.Start()

        $out = $p.StandardOutput.ReadToEnd()
        $err = $p.StandardError.ReadToEnd()
        $p.WaitForExit()

        if ($out.Trim()) { Write-Log $out.TrimEnd() }
        if ($err.Trim()) { Write-Log $err.TrimEnd() }
    } catch {
        Write-Log $_.Exception.Message
    }
})

$script:BtnSysInfo.Add_Click({
    Run-PS 'Get-ComputerInfo | Select-Object CsName, WindowsProductName, WindowsVersion, OsBuildNumber | Format-List'
})

$script:BtnClearLog.Add_Click({
    $script:LogBox.Clear()
    Write-Log "Log cleared."
})

$window.Add_ContentRendered({
    $script:SearchBox.Text = ""
})

[void]$window.ShowDialog()
