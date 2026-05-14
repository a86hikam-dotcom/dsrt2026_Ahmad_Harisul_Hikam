v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -280 10 -280 80 {lab=0}
N -170 80 10 80 {lab=0}
N 10 30 10 80 {lab=0}
N -280 -140 -280 -50 {lab=#net1}
N -280 -140 10 -140 {lab=#net1}
N 10 -140 10 -120 {lab=#net1}
N -170 20 -170 80 {lab=0}
N -210 80 -170 80 {lab=0}
N -170 -60 -170 -40 {lab=in}
N -170 -60 -110 -60 {lab=in}
N -110 -90 -110 -60 {lab=in}
N -110 -90 -30 -90 {lab=in}
N -110 -0 -30 -0 {lab=in}
N -110 -60 -110 0 {lab=in}
N 10 -50 10 -30 {lab=out}
N 10 -0 60 -0 {lab=0}
N 60 -0 60 80 {lab=0}
N 10 80 60 80 {lab=0}
N 10 -90 60 -90 {lab=#net1}
N 60 -140 60 -90 {lab=#net1}
N 10 -140 60 -140 {lab=#net1}
N 10 -50 60 -50 {lab=out}
N 10 -60 10 -50 {lab=out}
N -210 80 -210 90 {lab=0}
N -280 80 -210 80 {lab=0}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -10 0 0 0 {name=M1
W=3
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -280 -20 0 0 {name=V1 value=1.8 }
C {vsource.sym} -170 -10 0 0 {name=V2 value=0 }
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -10 -90 0 0 {name=M2
W=9
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} -170 -60 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 60 -50 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} -210 90 0 0 {name=l1 lab=0}
C {code.sym} -100 120 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value)"
value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {code_shown.sym} 110 -70 0 0 {name=s1 only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
dc v2 0 1.8. 0.01
plot in out
op 
.endc
"}
