Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Quran Time Utility"
        Height="760"
        Width="1280"
        MinHeight="700"
        MinWidth="1100"
        WindowStartupLocation="CenterScreen"
        ResizeMode="CanResize"
        Background="#0E1117"
        Foreground="#F3F4F6"
        FontFamily="Segoe UI">

    <Window.Resources>
        <SolidColorBrush x:Key="BgMain" Color="#0E1117"/>
        <SolidColorBrush x:Key="BgCard" Color="#111827"/>
        <SolidColorBrush x:Key="BgCard2" Color="#0F172A"/>
        <SolidColorBrush x:Key="BorderSoft" Color="#263244"/>
        <SolidColorBrush x:Key="TextMain" Color="#F3F4F6"/>
        <SolidColorBrush x:Key="TextMuted" Color="#94A3B8"/>
        <SolidColorBrush x:Key="Accent" Color="#3B82F6"/>
        <SolidColorBrush x:Key="Accent2" Color="#2563EB"/>
        <SolidColorBrush x:Key="Success" Color="#10B981"/>
        <SolidColorBrush x:Key="Danger" Color="#EF4444"/>

        <Style x:Key="TopTabButton" TargetType="Button">
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
            <Setter Property="Background" Value="#1F2937"/>
            <Setter Property="BorderBrush" Value="#425066"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Padding" Value="18,10"/>
            <Setter Property="Margin" Value="0,0,8,0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="MinWidth" Value="108"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
        </Style>

        <Style x:Key="PrimaryButton" TargetType="Button">
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="Background" Value="{DynamicResource Accent}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource Accent}"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Padding" Value="14,10"/>
            <Setter Property="Margin" Value="0,0,10,10"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="MinWidth" Value="170"/>
            <Setter Property="MinHeight" Value="38"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
        </Style>

        <Style x:Key="SecondaryButton" TargetType="Button">
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
            <Setter Property="Background" Value="#1F2937"/>
            <Setter Property="BorderBrush" Value="#425066"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Padding" Value="14,10"/>
            <Setter Property="Margin" Value="0,0,10,10"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="MinWidth" Value="170"/>
            <Setter Property="MinHeight" Value="38"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
        </Style>

        <Style x:Key="Card" TargetType="Border">
            <Setter Property="Background" Value="{DynamicResource BgCard}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource BorderSoft}"/>
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

        <Style x:Key="ToggleCheckBox" TargetType="CheckBox">
            <Setter Property="Foreground" Value="{DynamicResource TextMain}"/>
            <Setter Property="Margin" Value="0,0,0,10"/>
            <Setter Property="FontSize" Value="14"/>
        </Style>
    </Window.Resources>

    <Grid Background="{DynamicResource BgMain}">
        <Grid.RowDefinitions>
            <RowDefinition Height="64"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="220"/>
        </Grid.RowDefinitions>

        <!-- Top Bar -->
        <Border Grid.Row="0" Background="#0B1220" BorderBrush="{DynamicResource BorderSoft}" BorderThickness="0,0,0,1">
            <Grid Margin="14,10,14,10">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="Auto"/>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>

                <Border Width="34" Height="34" Background="{DynamicResource Accent}" CornerRadius="10" VerticalAlignment="Center">
                    <TextBlock Text="Q" Foreground="White" FontWeight="Bold" FontSize="18" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                </Border>

                <StackPanel Grid.Column="1" Orientation="Horizontal" Margin="16,0,0,0" VerticalAlignment="Center">
                    <Button x:Name="TabInstall" Style="{StaticResource TopTabButton}" Content="Install"/>
                    <Button x:Name="TabTweaks" Style="{StaticResource TopTabButton}" Content="Tweaks"/>
                    <Button x:Name="TabConfig" Style="{StaticResource TopTabButton}" Content="Config"/>
                    <Button x:Name="TabUpdates" Style="{StaticResource TopTabButton}" Content="Updates"/>
                    <Button x:Name="TabAbout" Style="{StaticResource TopTabButton}" Content="About"/>
                </StackPanel>

                <StackPanel Grid.Column="2" Orientation="Horizontal" VerticalAlignment="Center">
                    <Button x:Name="BtnTheme" Width="42" Height="34" Margin="0,0,8,0"
                            Background="#1F2937" BorderBrush="#425066" Foreground="White" BorderThickness="1"
                            Cursor="Hand" Content="☀"/>
                    <Button x:Name="BtnRename" Width="90" Height="34"
                            Background="#1F2937" BorderBrush="#425066" Foreground="White" BorderThickness="1"
                            Cursor="Hand" Content="Rename"/>
                </StackPanel>
            </Grid>
        </Border>

        <!-- Quick Actions -->
        <Border Grid.Row="1" Background="#111827" BorderBrush="{DynamicResource BorderSoft}" BorderThickness="0,0,0,1" Padding="14,12">
            <WrapPanel>
                <Button x:Name="BtnStandard" Style="{StaticResource PrimaryButton}" Content="Standard"/>
                <Button x:Name="BtnMinimal" Style="{StaticResource SecondaryButton}" Content="Minimal"/>
                <Button x:Name="BtnClear" Style="{StaticResource SecondaryButton}" Content="Clear"/>
                <Button x:Name="BtnGetInstalled" Style="{StaticResource SecondaryButton}" Content="Get Installed"/>
            </WrapPanel>
        </Border>

        <!-- Main Content -->
        <Grid Grid.Row="2" Margin="14">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="1.1*"/>
                <ColumnDefinition Width="0.9*"/>
            </Grid.ColumnDefinitions>

            <!-- Left Panel -->
            <Border Grid.Column="0" Style="{StaticResource Card}" Margin="0,0,10,0">
                <Grid>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                        <RowDefinition Height="Auto"/>
                    </Grid.RowDefinitions>

                    <StackPanel>
                        <TextBlock Text="Essential Tweaks" Style="{StaticResource SectionTitle}" />
                        <TextBlock Text="Starter list similar to Winutil style." Style="{StaticResource MutedText}" Margin="0,6,0,14"/>
                    </StackPanel>

                    <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                        <StackPanel>
                            <CheckBox x:Name="ChkRestorePoint" Style="{StaticResource ToggleCheckBox}" Content="Create Restore Point"/>
                            <CheckBox x:Name="ChkTemp" Style="{StaticResource ToggleCheckBox}" Content="Delete Temporary Files"/>
                            <CheckBox x:Name="ChkTelemetry" Style="{StaticResource ToggleCheckBox}" Content="Disable Telemetry"/>
                            <CheckBox x:Name="ChkActivity" Style="{StaticResource ToggleCheckBox}" Content="Disable Activity History"/>
                            <CheckBox x:Name="ChkGameDVR" Style="{StaticResource ToggleCheckBox}" Content="Disable GameDVR"/>
                            <CheckBox x:Name="ChkHiber" Style="{StaticResource ToggleCheckBox}" Content="Disable Hibernation"/>
                            <CheckBox x:Name="ChkHomeGroup" Style="{StaticResource ToggleCheckBox}" Content="Disable Homegroup"/>
                            <CheckBox x:Name="ChkLoc" Style="{StaticResource ToggleCheckBox}" Content="Disable Location Tracking"/>
                            <CheckBox x:Name="ChkStorage" Style="{StaticResource ToggleCheckBox}" Content="Disable Storage Sense"/>
                            <CheckBox x:Name="ChkEndTask" Style="{StaticResource ToggleCheckBox}" Content="Enable End Task With Right Click"/>
                            <CheckBox x:Name="ChkDiskCleanup" Style="{StaticResource ToggleCheckBox}" Content="Run Disk Cleanup"/>
                            <CheckBox x:Name="ChkTerminal" Style="{StaticResource ToggleCheckBox}" Content="Change Terminal Default"/>
                            <CheckBox x:Name="ChkRecall" Style="{StaticResource ToggleCheckBox}" Content="Disable Recall"/>
                            <TextBlock Text="Advanced Tweaks - Caution" Foreground="#60A5FA" FontSize="18" Margin="0,16,0,14"/>
                            <CheckBox x:Name="ChkIPv6" Style="{StaticResource ToggleCheckBox}" Content="Disable IPv6"/>
                            <CheckBox x:Name="ChkBgApps" Style="{StaticResource ToggleCheckBox}" Content="Disable Background Apps"/>
                            <CheckBox x:Name="ChkFullscreen" Style="{StaticResource ToggleCheckBox}" Content="Disable Fullscreen Optimizations"/>
                            <CheckBox x:Name="ChkCopilot" Style="{StaticResource ToggleCheckBox}" Content="Disable Microsoft Copilot"/>
                            <CheckBox x:Name="ChkWPBT" Style="{StaticResource ToggleCheckBox}" Content="Disable WPBT"/>
                            <CheckBox x:Name="ChkPerf" Style="{StaticResource ToggleCheckBox}" Content="Set Display For Performance"/>
                        </StackPanel>
                    </ScrollViewer>

                    <WrapPanel Grid.Row="2" Margin="0,14,0,0">
                        <Button x:Name="BtnRunTweaks" Style="{StaticResource PrimaryButton}" Content="Run Tweaks"/>
                        <Button x:Name="BtnUndoTweaks" Style="{StaticResource SecondaryButton}" Content="Undo Selected Tweaks"/>
                    </WrapPanel>
                </Grid>
            </Border>

            <!-- Right Panel -->
            <StackPanel Grid.Column="1">
                <Border Style="{StaticResource Card}">
                    <StackPanel>
                        <TextBlock Text="Customize Preferences" Style="{StaticResource SectionTitle}" />
                        <TextBlock Text="Theme and shell options." Style="{StaticResource MutedText}" Margin="0,6,0,14"/>

                        <CheckBox x:Name="PrefDark" Style="{StaticResource ToggleCheckBox}" Content="Dark Theme for Windows" IsChecked="True"/>
                        <CheckBox x:Name="PrefBing" Style="{StaticResource ToggleCheckBox}" Content="Bing Search in Start Menu" IsChecked="True"/>
                        <CheckBox x:Name="PrefNumLock" Style="{StaticResource ToggleCheckBox}" Content="NumLock on Startup" IsChecked="True"/>
                        <CheckBox x:Name="PrefVerbose" Style="{StaticResource ToggleCheckBox}" Content="Verbose Messages During Logon"/>
                        <CheckBox x:Name="PrefRecom" Style="{StaticResource ToggleCheckBox}" Content="Recommendations in Start Menu" IsChecked="True"/>
                        <CheckBox x:Name="PrefSnap" Style="{StaticResource ToggleCheckBox}" Content="Snap Window" IsChecked="True"/>
                        <CheckBox x:Name="PrefHidden" Style="{StaticResource ToggleCheckBox}" Content="Show Hidden Files" IsChecked="True"/>
                        <CheckBox x:Name="PrefExt" Style="{StaticResource ToggleCheckBox}" Content="Show File Extensions" IsChecked="True"/>
                        <CheckBox x:Name="PrefSearch" Style="{StaticResource ToggleCheckBox}" Content="Search Button in Taskbar" IsChecked="True"/>
                        <CheckBox x:Name="PrefTaskView" Style="{StaticResource ToggleCheckBox}" Content="Task View Button in Taskbar"/>
                    </StackPanel>
                </Border>

                <Border Style="{StaticResource Card}">
                    <StackPanel>
                        <TextBlock Text="Performance Plans" Style="{StaticResource SectionTitle}" />
                        <TextBlock Text="Safe starter actions for testing." Style="{StaticResource MutedText}" Margin="0,6,0,14"/>
                        <Button x:Name="BtnUltimateOn" Style="{StaticResource PrimaryButton}" Content="Add and Activate Ultimate Performance"/>
                        <Button x:Name="BtnUltimateOff" Style="{StaticResource SecondaryButton}" Content="Remove Ultimate Performance"/>
                    </StackPanel>
                </Border>

                <Border Style="{StaticResource Card}">
                    <StackPanel>
                        <TextBlock Text="Window Info" Style="{StaticResource SectionTitle}" />
                        <TextBlock x:Name="TxtWindowName" Text="Current Window Name: Quran Time Utility" Margin="0,12,0,8" Foreground="#D1D5DB"/>
                        <TextBlock Text="Click Rename to change the title live." Style="{StaticResource MutedText}"/>
                    </StackPanel>
                </Border>
            </StackPanel>
        </Grid>

        <!-- Log Panel -->
        <Border Grid.Row="3" Margin="14,0,14,14" Background="#0B1220" BorderBrush="{DynamicResource BorderSoft}" BorderThickness="1" CornerRadius="14" Padding="14">
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

                    <TextBlock Text="Output Log" FontSize="18" FontWeight="Bold" Foreground="{DynamicResource TextMain}"/>
                    <Button x:Name="BtnClearLog" Grid.Column="1" Width="90" Height="32"
                            Background="#1F2937" BorderBrush="#425066" Foreground="White" BorderThickness="1"
                            Cursor="Hand" Content="Clear"/>
                </Grid>

                <TextBox x:Name="LogBox"
                         Grid.Row="1"
                         Background="#020617"
                         Foreground="#BBF7D0"
                         BorderBrush="#334155"
                         BorderThickness="1"
                         FontFamily="Consolas"
                         FontSize="13"
                         Padding="12"
                         AcceptsReturn="True"
                         TextWrapping="Wrap"
                         VerticalScrollBarVisibility="Auto"
                         IsReadOnly="True"/>
            </Grid>
        </Border>
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$names = @(
    "TabInstall","TabTweaks","TabConfig","TabUpdates","TabAbout",
    "BtnTheme","BtnRename","BtnStandard","BtnMinimal","BtnClear","BtnGetInstalled",
    "BtnRunTweaks","BtnUndoTweaks","BtnUltimateOn","BtnUltimateOff","BtnClearLog",
    "LogBox","TxtWindowName",
    "ChkRestorePoint","ChkTemp","ChkTelemetry","ChkActivity","ChkGameDVR","ChkHiber",
    "ChkHomeGroup","ChkLoc","ChkStorage","ChkEndTask","ChkDiskCleanup","ChkTerminal",
    "ChkRecall","ChkIPv6","ChkBgApps","ChkFullscreen","ChkCopilot","ChkWPBT","ChkPerf"
)

foreach ($n in $names) {
    Set-Variable -Name $n -Value $window.FindName($n) -Scope Script
}

$script:IsDark = $true

function Write-Log {
    param([string]$Message)
    $t = Get-Date -Format "HH:mm:ss"
    $script:LogBox.AppendText("[$t] $Message`r`n")
    $script:LogBox.ScrollToEnd()
}

function Set-DarkTheme {
    $window.Background = [System.Windows.Media.Brushes]::Transparent
    $window.Resources["BgMain"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#0E1117"))
    $window.Resources["BgCard"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#111827"))
    $window.Resources["BgCard2"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#0F172A"))
    $window.Resources["BorderSoft"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#263244"))
    $window.Resources["TextMain"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#F3F4F6"))
    $window.Resources["TextMuted"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#94A3B8"))
    Write-Log "Dark theme enabled."
}

function Set-LightTheme {
    $window.Background = [System.Windows.Media.Brushes]::Transparent
    $window.Resources["BgMain"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#F3F4F6"))
    $window.Resources["BgCard"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#FFFFFF"))
    $window.Resources["BgCard2"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#E5E7EB"))
    $window.Resources["BorderSoft"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#CBD5E1"))
    $window.Resources["TextMain"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#111827"))
    $window.Resources["TextMuted"] = [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#475569"))
    Write-Log "Light theme enabled."
}

function Get-SelectedTweaks {
    $items = @()

    if ($script:ChkRestorePoint.IsChecked) { $items += "Create Restore Point" }
    if ($script:ChkTemp.IsChecked) { $items += "Delete Temporary Files" }
    if ($script:ChkTelemetry.IsChecked) { $items += "Disable Telemetry" }
    if ($script:ChkActivity.IsChecked) { $items += "Disable Activity History" }
    if ($script:ChkGameDVR.IsChecked) { $items += "Disable GameDVR" }
    if ($script:ChkHiber.IsChecked) { $items += "Disable Hibernation" }
    if ($script:ChkHomeGroup.IsChecked) { $items += "Disable Homegroup" }
    if ($script:ChkLoc.IsChecked) { $items += "Disable Location Tracking" }
    if ($script:ChkStorage.IsChecked) { $items += "Disable Storage Sense" }
    if ($script:ChkEndTask.IsChecked) { $items += "Enable End Task With Right Click" }
    if ($script:ChkDiskCleanup.IsChecked) { $items += "Run Disk Cleanup" }
    if ($script:ChkTerminal.IsChecked) { $items += "Change Terminal Default" }
    if ($script:ChkRecall.IsChecked) { $items += "Disable Recall" }
    if ($script:ChkIPv6.IsChecked) { $items += "Disable IPv6" }
    if ($script:ChkBgApps.IsChecked) { $items += "Disable Background Apps" }
    if ($script:ChkFullscreen.IsChecked) { $items += "Disable Fullscreen Optimizations" }
    if ($script:ChkCopilot.IsChecked) { $items += "Disable Copilot" }
    if ($script:ChkWPBT.IsChecked) { $items += "Disable WPBT" }
    if ($script:ChkPerf.IsChecked) { $items += "Set Display For Performance" }

    return $items
}

function Clear-Tweaks {
    foreach ($name in @(
        "ChkRestorePoint","ChkTemp","ChkTelemetry","ChkActivity","ChkGameDVR","ChkHiber",
        "ChkHomeGroup","ChkLoc","ChkStorage","ChkEndTask","ChkDiskCleanup","ChkTerminal",
        "ChkRecall","ChkIPv6","ChkBgApps","ChkFullscreen","ChkCopilot","ChkWPBT","ChkPerf"
    )) {
        (Get-Variable -Name $name -Scope Script).Value.IsChecked = $false
    }
    Write-Log "All tweak checkboxes cleared."
}

$window.Title = "Quran Time Utility"
$script:TxtWindowName.Text = "Current Window Name: $($window.Title)"
Write-Log "GUI loaded successfully."
Write-Log "Window title set to: $($window.Title)"

$script:BtnTheme.Add_Click({
    if ($script:IsDark) {
        Set-LightTheme
        $script:BtnTheme.Content = "☾"
        $script:IsDark = $false
    } else {
        Set-DarkTheme
        $script:BtnTheme.Content = "☀"
        $script:IsDark = $true
    }
})

$script:BtnRename.Add_Click({
    $newTitle = "Quran Time Utility Pro"
    $window.Title = $newTitle
    $script:TxtWindowName.Text = "Current Window Name: $newTitle"
    Write-Log "Window title changed to: $newTitle"
})

$script:TabInstall.Add_Click({ Write-Log "Install tab clicked." })
$script:TabTweaks.Add_Click({ Write-Log "Tweaks tab clicked." })
$script:TabConfig.Add_Click({ Write-Log "Config tab clicked." })
$script:TabUpdates.Add_Click({ Write-Log "Updates tab clicked." })
$script:TabAbout.Add_Click({ Write-Log "About tab clicked." })

$script:BtnStandard.Add_Click({
    $script:ChkTelemetry.IsChecked = $true
    $script:ChkActivity.IsChecked = $true
    $script:ChkTemp.IsChecked = $true
    $script:ChkStorage.IsChecked = $true
    $script:ChkRecall.IsChecked = $true
    Write-Log "Standard preset selected."
})

$script:BtnMinimal.Add_Click({
    Clear-Tweaks
    $script:ChkTemp.IsChecked = $true
    $script:ChkTelemetry.IsChecked = $true
    Write-Log "Minimal preset selected."
})

$script:BtnClear.Add_Click({
    Clear-Tweaks
})

$script:BtnGetInstalled.Add_Click({
    try {
        $apps = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* -ErrorAction SilentlyContinue |
            Select-Object DisplayName |
            Where-Object { $_.DisplayName } |
            Select-Object -First 20
        Write-Log "Installed apps sample:"
        foreach ($app in $apps) {
            Write-Log " - $($app.DisplayName)"
        }
    } catch {
        Write-Log $_.Exception.Message
    }
})

$script:BtnRunTweaks.Add_Click({
    $selected = Get-SelectedTweaks
    if ($selected.Count -eq 0) {
        Write-Log "No tweaks selected."
        return
    }

    Write-Log "Selected tweaks:"
    foreach ($item in $selected) {
        Write-Log " - $item"
    }
    Write-Log "Demo mode only: no destructive commands executed yet."
})

$script:BtnUndoTweaks.Add_Click({
    Write-Log "Undo requested."
    Write-Log "Later we can map each tweak to a real rollback command."
})

$script:BtnUltimateOn.Add_Click({
    Write-Log "Would run: powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61"
})

$script:BtnUltimateOff.Add_Click({
    Write-Log "Would remove custom ultimate performance plan if created."
})

$script:BtnClearLog.Add_Click({
    $script:LogBox.Clear()
    Write-Log "Log cleared."
})

[void]$window.ShowDialog()
