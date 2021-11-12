function Show-Calendar { 

    param( 

        [DateTime] $start = [DateTime]::Today, 

        [DateTime] $end = $start, 

        $firstDayOfWeek, 

        [int[]] $highlightDay, 

        [string[]] $highlightDate = [DateTime]::Today.ToString() 

    ) 

    $start = New-Object DateTime $start.Year,$start.Month,1 

    $end = New-Object DateTime $end.Year,$end.Month,1 

    $dateTimeFormat  = (Get-Culture).DateTimeFormat 

    if($firstDayOfWeek) 

    { 

        $dateTimeFormat.FirstDayOfWeek = $firstDayOfWeek 

    } 

 

    $currentDay = $start 
    while($start -le $end) 

    { 

        while($currentDay.DayOfWeek -ne $dateTimeFormat.FirstDayOfWeek) 

        { 

            $currentDay = $currentDay.AddDays(-1) 

        } 
        $currentWeek = New-Object PsObject 

        $dayNames = @() 

        $weeks = @() 

        while(($currentDay -lt $start.AddMonths(1)) -or 

            ($currentDay.DayOfWeek -ne $dateTimeFormat.FirstDayOfWeek)) 

        { 
            $dayName = "{0:ddd}" -f $currentDay 

            if($dayNames -notcontains $dayName) 

            { 

                $dayNames += $dayName 

            } 
            $displayDay = " {0,2} " -f $currentDay.Day 

            if($highlightDate) 

            { 

                $compareDate = New-Object DateTime $currentDay.Year, 

                    $currentDay.Month,$currentDay.Day 

                if($highlightDate -contains $compareDate) 

                { 

                    $displayDay = "*" + ("{0,2}" -f $currentDay.Day) + "*" 

                } 

            } 
            if($highlightDay -and ($highlightDay[0] -eq $currentDay.Day)) 

            { 

                $displayDay = "[" + ("{0,2}" -f $currentDay.Day) + "]" 

                $null,$highlightDay = $highlightDay 

            } 
            $currentWeek | Add-Member NoteProperty $dayName $displayDay 
            $currentDay = $currentDay.AddDays(1) 
            if($currentDay.DayOfWeek -eq $dateTimeFormat.FirstDayOfWeek) 

            { 

                $weeks += $currentWeek 

                $currentWeek = New-Object PsObject 

            } 

        } 

        $calendar = $weeks | Format-Table $dayNames -AutoSize | Out-String 

        $width = ($calendar.Split("`n") | Measure-Object -Maximum Length).Maximum 

        $header = "{0:MMMM yyyy}" -f $start 

        $padding = " " * (($width - $header.Length) / 2) 

        $displayCalendar = " `n" + $padding + $header + "`n " + $calendar 

        $displayCalendar.TrimEnd() 

        $start = $start.AddMonths(1) 

 

    } 

} -ErrorAction SilentlyContinue

function Hora-fecha{
$Menu= Read-Host "Elige una opcion: 
1:¿Deseas ver la hora?
2:¿O desea ver la hora y la fecha?                                                                                                                       
Opción"
clear-host
Switch($Menu){
  1{Get-Date -DisplayHint Time} 
  2{Get-Date}
  Default {Write-Host "Opción no valida" -ErrorAction SilentlyContinue}
}}

Function Archivos-fecha{
param (
            [string]$Ruta = "",
            [string]$Type = "",
            [int32]$month = "",
            [int32]$year = ""
)
    $Ruta = Read-Host "Dame la ruta: Ejem D:"
    $Type = Read-Host "Dame el tipo: Ejem docx"
    $month = Read-Host "Dame el mes: Ejem 02"
    $year = Read-host "Dame el año: Ejem 2020"


Get-ChildItem -Path $Ruta -Include *.$Type -Recurse -File | 
    Where-Object { $_.lastwritetime.month -eq $month -AND $_.lastwritetime.year -eq $year}  
}

Export-ModuleMember -Function Show-Calendar -Function Hora-fecha -Function Archivos-fecha