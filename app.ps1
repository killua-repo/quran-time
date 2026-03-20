Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="WinMiniUtil"
        Height="760"
        Width="1220"
        MinHeight="680"
        MinWidth="1080"
        WindowStartupLocation="CenterScreen"
        Background="#0B1220"
        Foreground="#E5E7EB"
        FontFamily="Segoe UI">
    <Window.Resources>
        <Style x:Key="NavButton" TargetType="Button">
            <Setter Property="Margin" Value="0,0,0,10"/>
            <Setter Property="Padding" Value="14,12"/>
            <Setter Property="HorizontalContentAlignment" Value="Left"/>
            <Setter Property="Background" Value="#111827"/>
            <Setter Property="Foreground" Value="#E5E7EB"/>
            <Setter Property="BorderBrush" Value="#1F2937"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="Cursor" Value="Hand"/>
        </Style>

        <Style x:Key="ActionButton" TargetType="Button">
            <Setter Property="Margin" Value="0,0,10,10"/>
            <Setter Property="Padding" Value="12,10"/>
            <Setter Property="Background" Value="#2563EB"/>
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="BorderBrush" Value="#2563EB"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="FontSize" Value="13"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="MinWidth" Value="180"/>
            <Setter Property="MinHeight" Value="38"/>
        </Style>

        <Style x:Key="CardBorder" TargetType="Border">
            <Setter Property="Background" Value="#111827"/>
            <Setter Property="BorderBrush" Value="#1F2937"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="CornerRadius" Value="14"/>
            <Setter Property="Padding" Value="18"/>
            <Setter Property="Margin" Value="0,0,0,16"/>
        </Style>
    </Window.Resources>

    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="250"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>

        <Border Grid.Column="0" Background="#0F172A" BorderBrush="#1F2937" BorderThickness="0,0,1,0">
            <DockPanel LastChildFill="True">
                <StackPanel DockPanel.Dock="Top" Margin="20,24,20,12">
                    <TextBlock Text="WinMiniUtil" FontSize="24" FontWeight="Bold"/>
                    <TextBlock Text="PowerShell GUI Tool" FontSize="12" Foreground="#93C5FD" Margin="0,6,0,0"/>
                </StackPanel>

                <StackPanel Margin="14,8,14,14">
                    <Button x:Name="NavHome" Style="{StaticResource NavButton}" Content="Home"/>
                    <Button x:Name="NavApps" Style="{StaticResource NavButton}" Content="Apps"/>
                    <Button x:Name="NavTweaks" Style="{StaticResource NavButton}" Content="Tweaks"/>
                    <Button x:Name="NavAbout" Style="{StaticResource NavButton}" Content="About"/>
                </StackPanel>
            </DockPanel>
        </Border>

        <Grid Grid.Column="1" Margin="18">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="230"/>
            </Grid.RowDefinitions>

            <Border Grid.Row="0" Background="#111827" BorderBrush="#1F2937" BorderThickness="1" CornerRadius="14" Padding="18" Margin="0,0,0,16">
                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*"/>
                        <ColumnDefinition Width="Auto"/>
                    </Grid.ColumnDefinitions>

                    <StackPanel>
                        <TextBlock x:Name="HeaderTitle" Text="Windows-style admin utility" FontSize="24" FontWeight="Bold"/>
                        <TextBlock x:Name="HeaderSubTitle" Text="Portable script with modern dark GUI." FontSize="13" Foreground="#94A3B8" Margin="0,8,0,0"/>
                    </StackPanel>

                    <StackPanel Grid.Column="1" Orientation="Horizontal" VerticalAlignment="Center">
                        <Border Background="#1D4ED8" CornerRadius="12" Padding="10,5" Margin="0,0,8,0">
                            <TextBlock Text="WPF" Foreground="White" FontWeight="SemiBold"/>
                        </Border>
                        <Border Background="#059669" CornerRadius="12" Padding="10,5">
                            <TextBlock Text="PowerShell" Foreground="White" FontWeight="SemiBold"/>
                        </Border>
                    </StackPanel>
                </Grid>
            </Border>

            <Grid Grid.Row="1">
                <Grid x:Name="HomePanel">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <StackPanel>
                            <Border Style="{StaticResource CardBorder}">
                                <StackPanel>
                                    <TextBlock Text="Welcome" FontSize="22" FontWeight="Bold"/>
                                    <TextBlock Text="This starter UI is made for testing, learning, and turning your scripts into a real Windows app style." 
                                               TextWrapping="Wrap" Margin="0,10,0,12" Foreground="#CBD5E1"/>
                                    <WrapPanel>
                                        <Button x:Name="BtnGoApps" Style="{StaticResource ActionButton}" Content="Open Apps Page"/>
                                        <Button x:Name="BtnGoTweaks" Style="{StaticResource ActionButton}" Content="Open Tweaks Page"/>
                                        <Button x:Name="BtnOpenGithub" Style="{StaticResource ActionButton}" Content="Open GitHub"/>
                                    </WrapPanel>
                                </StackPanel>
                            </Border>

                            <Grid Margin="0,0,0,8">
                                <Grid.ColumnDefinitions>
                                    <ColumnDefinition Width="*"/>
                                    <ColumnDefinition Width="*"/>
                                </Grid.ColumnDefinitions>

                                <Border Grid.Column="0" Style="{StaticResource CardBorder}" Margin="0,0,8,0">
                                    <StackPanel>
                                        <TextBlock Text="What this app does" FontSize="18" FontWeight="Bold"/>
                                        <TextBlock Text="• Runs Windows commands from buttons" Margin="0,12,0,6" Foreground="#CBD5E1"/>
                                        <TextBlock Text="• Shows output inside the log panel" Margin="0,0,0,6" Foreground="#CBD5E1"/>
                                        <TextBlock Text="• Gives you a clean base to add your own tools" Foreground="#CBD5E1"/>
                                    </StackPanel>
                                </Border>

                                <Border Grid.Column="1" Style="{StaticResource CardBorder}" Margin="8,0,0,0">
                                    <StackPanel>
                                        <TextBlock Text="Next upgrades" FontSize="18" FontWeight="Bold"/>
                                        <TextBlock Text="• Add icons" Margin="0,12,0,6" Foreground="#CBD5E1"/>
                                        <TextBlock Text="• Add admin-only actions" Margin="0,0,0,6" Foreground="#CBD5E1"/>
                                        <TextBlock Text="• Add tabs, settings, and JSON config" Foreground="#CBD5E1"/>
                                    </StackPanel>
                                </Border>
                            </Grid>
                        </StackPanel>
                    </ScrollViewer>
                </Grid>

                <Grid x:Name="AppsPanel" Visibility="Collapsed">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <StackPanel>
                            <Border Style="{StaticResource CardBorder}">
                                <StackPanel>
                                    <TextBlock Text="Apps and tools" FontSize="22" FontWeight="Bold"/>
                                    <TextBlock Text="Run common commands quickly from buttons." Margin="0,10,0,14" Foreground="#CBD5E1"/>
                                    <WrapPanel>
                                        <Button x:Name="BtnWingetList" Style="{StaticResource ActionButton}" Content="Winget List"/>
                                        <Button x:Name="BtnTaskMgr" Style="{StaticResource ActionButton}" Content="Open Task Manager"/>
                                        <Button x:Name="BtnWinUpdate" Style="{StaticResource ActionButton}" Content="Open Windows Update"/>
                                        <Button x:Name="BtnTempFolder" Style="{StaticResource ActionButton}" Content="Open Temp Folder"/>
                                    </WrapPanel>
                                </StackPanel>
                            </Border>

                            <Border Style="{StaticResource CardBorder}">
                                <StackPanel>
                                    <TextBlock Text="System info" FontSize="22" FontWeight="Bold"/>
                                    <TextBlock Text="Useful info for debugging and testing." Margin="0,10,0,14" Foreground="#CBD5E1"/>
                                    <WrapPanel>
                                        <Button x:Name="BtnSystemInfo" Style="{StaticResource ActionButton}" Content="Get Computer Info"/>
                                        <Button x:Name="BtnIPConfig" Style="{StaticResource ActionButton}" Content="IP Config"/>
                                        <Button x:Name="BtnTopProcesses" Style="{StaticResource ActionButton}" Content="Top Processes"/>
                                    </WrapPanel>
                                </StackPanel>
                            </Border>
                        </StackPanel>
                    </ScrollViewer>
                </Grid>

                <Grid x:Name="TweaksPanel" Visibility="Collapsed">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <StackPanel>
                            <Border Style="{StaticResource CardBorder}">
                                <StackPanel>
                                    <TextBlock Text="Safe test tweaks" FontSize="22" FontWeight="Bold"/>
                                    <TextBlock Text="These are simple starter actions you can test now." Margin="0,10,0,14" Foreground="#CBD5E1"/>
                                    <WrapPanel>
                                        <Button x:Name="BtnFlushDNS" Style="{StaticResource ActionButton}" Content="Flush DNS"/>
                                        <Button x:Name="BtnTempStats" Style="{StaticResource ActionButton}" Content="Temp Stats"/>
                                        <Button x:Name="BtnServices" Style="{StaticResource ActionButton}" Content="Running Services"/>
                                    </WrapPanel>
                                </StackPanel>
                            </Border>

                            <Border Style="{StaticResource CardBorder}">
                                <StackPanel>
                                    <TextBlock Text="Notes" FontSize="18" FontWeight="Bold"/>
                                    <TextBlock Text="Later you can add admin tweaks like registry edits, debloat scripts, package installs, and restore points." 
                                               TextWrapping="Wrap" Margin="0,12,0,0" Foreground="#CBD5E1"/>
                                </StackPanel>
                            </Border>
                        </StackPanel>
                    </ScrollViewer>
                </Grid>

                <Grid x:Name="AboutPanel" Visibility="Collapsed">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <StackPanel>
                            <Border Style="{StaticResource CardBorder}">
                                <StackPanel>
                                    <TextBlock Text="About this starter" FontSize="22" FontWeight="Bold"/>
                                    <TextBlock Text="This is a one-file GUI project. Test locally first, then push it to GitHub, then use a raw URL launch command." 
                                               TextWrapping="Wrap" Margin="0,10,0,12" Foreground="#CBD5E1"/>
                                    <TextBlock Text="Replace USERNAME and REPO below after you upload the file:" Margin="0,0,0,8" Foreground="#CBD5E1"/>
                                    <TextBox x:Name="TxtLaunch"
                                             Text='irm "https://raw.githubusercontent.com/USERNAME/REPO/main/app.ps1" | iex'
                                             Background="#0B1220"
                                             Foreground="#E5E7EB"
                                             BorderBrush="#334155"
                                             BorderThickness="1"
                                             Padding="12"
                                             FontFamily="Consolas"
                                             FontSize="13"
                                             TextWrapping="Wrap"
                                             AcceptsReturn="True"
                                             Height="70"/>
                                    <WrapPanel Margin="0,12,0,0">
                                        <Button x:Name="BtnCopyLaunch" Style="{StaticResource ActionButton}" Content="Copy Launch Command"/>
                                    </WrapPanel>
                                </StackPanel>
                            </Border>
                        </StackPanel>
                    </ScrollViewer>
                </Grid>
            </Grid>

            <Border Grid.Row="2" Background="#111827" BorderBrush="#1F2937" BorderThickness="1" CornerRadius="14" Padding="14">
                <Grid>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <Grid Grid.Row="0" Margin="0,0,0,10">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="Auto"/>
                        </Grid.ColumnDefinitions>
                        <TextBlock Text="Output Log" FontSize="18" FontWeight="Bold"/>
                        <Button x:Name="BtnClearLog"
                                Grid.Column="1"
                                Content="Clear"
                                Padding="10,6"
                                Background="#334155"
                                Foreground="White"
                                BorderThickness="0"
                                Cursor="Hand"/>
                    </Grid>

                    <TextBox x:Name="LogBox"
                             Grid.Row="1"
                             Background="#0B1220"
                             Foreground="#D1FAE5"
                             BorderBrush="#334155"
                             BorderThickness="1"
                             Padding="12"
                             FontFamily="Consolas"
                             FontSize="13"
                             AcceptsReturn="True"
                             AcceptsTab="True"
                             IsReadOnly="True"
                             VerticalScrollBarVisibility="Auto"
                             TextWrapping="Wrap"/>
                </Grid>
            </Border>
        </Grid>
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$controlNames = @(
    "NavHome","NavApps","NavTweaks","NavAbout",
    "HeaderTitle","HeaderSubTitle",
    "HomePanel","AppsPanel","TweaksPanel","AboutPanel",
    "BtnGoApps","BtnGoTweaks","BtnOpenGithub",
    "BtnWingetList","BtnTaskMgr","BtnWinUpdate","BtnTempFolder",
    "BtnSystemInfo","BtnIPConfig","BtnTopProcesses",
    "BtnFlushDNS","BtnTempStats","BtnServices",
    "BtnCopyLaunch","BtnClearLog","LogBox","TxtLaunch"
)

foreach ($name in $controlNames) {
    Set-Variable -Name $name -Value $window.FindName($name) -Scope Script
}

function Write-Log {
    param([string]$Message)

    $time = Get-Date -Format "HH:mm:ss"
    $script:LogBox.AppendText("[$time] $Message`r`n")
    $script:LogBox.ScrollToEnd()
}

function Show-Page {
    param(
        [string]$PanelName,
        [string]$Title,
        [string]$SubTitle
    )

    $script:HomePanel.Visibility   = "Collapsed"
    $script:AppsPanel.Visibility   = "Collapsed"
    $script:TweaksPanel.Visibility = "Collapsed"
    $script:AboutPanel.Visibility  = "Collapsed"

    switch ($PanelName) {
        "Home"   { $script:HomePanel.Visibility   = "Visible" }
        "Apps"   { $script:AppsPanel.Visibility   = "Visible" }
        "Tweaks" { $script:TweaksPanel.Visibility = "Visible" }
        "About"  { $script:AboutPanel.Visibility  = "Visible" }
    }

    $script:HeaderTitle.Text = $Title
    $script:HeaderSubTitle.Text = $SubTitle
}

function Run-External {
    param(
        [string]$FileName,
        [string]$Arguments
    )

    try {
        Write-Log "Running: $FileName $Arguments"

        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = $FileName
        $psi.Arguments = $Arguments
        $psi.RedirectStandardOutput = $true
        $psi.RedirectStandardError = $true
        $psi.UseShellExecute = $false
        $psi.CreateNoWindow = $true

        $process = New-Object System.Diagnostics.Process
        $process.StartInfo = $psi
        [void]$process.Start()

        $stdout = $process.StandardOutput.ReadToEnd()
        $stderr = $process.StandardError.ReadToEnd()

        $process.WaitForExit()

        if ($stdout -and $stdout.Trim()) {
            Write-Log ($stdout.TrimEnd())
        }

        if ($stderr -and $stderr.Trim()) {
            Write-Log ($stderr.TrimEnd())
        }

        Write-Log "Exit Code: $($process.ExitCode)"
    }
    catch {
        Write-Log $_.Exception.Message
    }
}

function Run-PS {
    param([string]$Command)

    try {
        Write-Log "Running PowerShell command..."
        $result = Invoke-Expression $Command | Out-String
        if ($result -and $result.Trim()) {
            Write-Log ($result.TrimEnd())
        }
        else {
            Write-Log "Command completed."
        }
    }
    catch {
        Write-Log $_.Exception.Message
    }
}

Show-Page -PanelName "Home" -Title "Windows-style admin utility" -SubTitle "Portable script with modern dark GUI."
Write-Log "App loaded successfully."
Write-Log "Use the sidebar to switch between pages."

$script:NavHome.Add_Click({
    Show-Page -PanelName "Home" -Title "Windows-style admin utility" -SubTitle "Portable script with modern dark GUI."
})

$script:NavApps.Add_Click({
    Show-Page -PanelName "Apps" -Title "Apps and tools" -SubTitle "Run common commands quickly."
})

$script:NavTweaks.Add_Click({
    Show-Page -PanelName "Tweaks" -Title "Tweaks" -SubTitle "Starter actions you can test safely."
})

$script:NavAbout.Add_Click({
    Show-Page -PanelName "About" -Title "About this starter" -SubTitle "One-file project ready for GitHub."
})

$script:BtnGoApps.Add_Click({
    Show-Page -PanelName "Apps" -Title "Apps and tools" -SubTitle "Run common commands quickly."
})

$script:BtnGoTweaks.Add_Click({
    Show-Page -PanelName "Tweaks" -Title "Tweaks" -SubTitle "Starter actions you can test safely."
})

$script:BtnOpenGithub.Add_Click({
    Start-Process "https://github.com"
    Write-Log "GitHub opened in browser."
})

$script:BtnWingetList.Add_Click({
    Run-External -FileName "winget" -Arguments "list"
})

$script:BtnTaskMgr.Add_Click({
    Start-Process "taskmgr"
    Write-Log "Task Manager opened."
})

$script:BtnWinUpdate.Add_Click({
    Start-Process "ms-settings:windowsupdate"
    Write-Log "Windows Update opened."
})

$script:BtnTempFolder.Add_Click({
    Start-Process $env:TEMP
    Write-Log "Temp folder opened: $env:TEMP"
})

$script:BtnSystemInfo.Add_Click({
    Run-PS 'Get-ComputerInfo | Select-Object CsName, WindowsProductName, WindowsVersion, OsBuildNumber | Format-List'
})

$script:BtnIPConfig.Add_Click({
    Run-External -FileName "ipconfig" -Arguments "/all"
})

$script:BtnTopProcesses.Add_Click({
    Run-PS 'Get-Process | Sort-Object CPU -Descending | Select-Object -First 15 Name, Id, CPU, WS | Format-Table -AutoSize'
})

$script:BtnFlushDNS.Add_Click({
    Run-External -FileName "ipconfig" -Arguments "/flushdns"
})

$script:BtnTempStats.Add_Click({
    try {
        $items = Get-ChildItem -Path $env:TEMP -Force -ErrorAction SilentlyContinue
        $count = ($items | Measure-Object).Count
        $size = ($items | Measure-Object -Property Length -Sum).Sum
        $sizeMB = [math]::Round(($size / 1MB), 2)
        Write-Log "Temp items: $count"
        Write-Log "Approx temp size: $sizeMB MB"
    }
    catch {
        Write-Log $_.Exception.Message
    }
})

$script:BtnServices.Add_Click({
    Run-PS 'Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object -First 25 Name, DisplayName, Status | Format-Table -AutoSize'
})

$script:BtnCopyLaunch.Add_Click({
    [System.Windows.Clipboard]::SetText($script:TxtLaunch.Text)
    Write-Log "Launch command copied to clipboard."
})

$script:BtnClearLog.Add_Click({
    $script:LogBox.Clear()
    Write-Log "Log cleared."
})

[void]$window.ShowDialog()
