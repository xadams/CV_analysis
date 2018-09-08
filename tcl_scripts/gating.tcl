cv molid top
cv configfile /home/xadams/bin/gating.in
set file [open "gating.log" w]
puts -nonewline $file [cv printframelabels]
set n [expr {int([molinfo top get numframes])}]
for {set i 0 } { $i < $n } { incr i } {
    cv frame $i
    cv update
    set distances [cv printframe]
    puts -nonewline $file $distances
    unset distances
}
close $file
exit
