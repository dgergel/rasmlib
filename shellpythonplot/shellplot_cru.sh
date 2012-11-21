#!/bin/bash

erap=/raid/muxiao/crudata/cru_shape/       # ERA data path
figp=.   # output figure path
rasm2=/nfs/hydro6/raid/nijssen/rasm/r33RBVIC70/lnd/hist/
rasm1=/nfs/hydro6/raid/nijssen/rasm/r33RBVIC60/lnd/hist/
rasm3=/raid/muxiao/eradata/era_shaped/
rasmfn3=era-interim.        #1990-1999-01.monthly.mean.nc
rasmfn1=r33RBVIC60.vic.ha.
rasmfn2=r33RBVIC70.vic.ha.
erafn=cru_ts_3_10.tmp.
nameend=.mean.nc


ses=DJFJJAMAMSON
i=1
while [ $i -lt 3 ] #   5 ]      # change to 4 seasons
do
let "sp=0+(i-1)*3"
let "ep=3" 
sea=$echo${ses:$sp:$ep}

way1=$rasm1$rasmfn1\1990-1999.$sea$nameend
way2=$rasm2$rasmfn2\1990-1999.$sea$nameend
way3=$rasm3$rasmfn3\1990-1999.$sea$nameend
waye=$erap$erafn\1990-1999.$sea$nameend
python ./plot_cru.py --r1 $way1 --r2 $way2 --r3 $way3 --era $waye --figpath $figp --time $sea
echo $sea
let "i=$i+1"
done



i=0
while [ $i -lt 2 ]  #  10 ]      # change to 10 years
do
year=199$i
way1=$rasm1$rasmfn1$year$nameend
way2=$rasm2$rasmfn2$year$nameend
way3=$rasm3$rasmfn3$year$nameend
waye=$erap$erafn$year$nameend

python ./plot_cru.py --r1 $way1 --r2 $way2 --r3 $way3 --era $waye --figpath $figp --time $year
echo $year

let "i=$i+1"
done



for i in $echo {01..02}  # change to 12 months
do
mon=$i
mid1=1990-1999-
mid2=.monthly
way1=$rasm1$rasmfn1$mid1$mon$mid2$nameend
way2=$rasm2$rasmfn2$mid1$mon$mid2$nameend
way3=$rasm3$rasmfn3$mid1$mon$mid2$nameend
waye=$erap$erafn$mid1$mon$mid2$nameend
echo $way1
echo $waye
python ./plot_cru.py --r1 $way1 --r2 $way2 --r3 $way3 --era $waye --figpath $figp --time $mon
echo $mon

done


mid=1990-1999
way1=$rasm1$rasmfn1$mid$nameend
way2=$rasm2$rasmfn2$mid$nameend
way3=$rasm3$rasmfn3$mid$nameend
waye=$erap$erafn$mid$nameend

python ./plot_cru.py --r1 $way1 --r2 $way2 --r3 $way3 --era $waye --figpath $figp --time $mid
echo $mid



