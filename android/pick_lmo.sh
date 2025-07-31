# To build LMODroid 7 by picking patches from gerrit
# Repo int fifteen branch locally
#
# > repo init -u https://gerrit.libremobileos.com/LMODroid/manifest -b refs/changes/68/20868/6 --git-lfs
#
#
# Then sync
# > repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
#
# Now run this script from the root of the source dir
#

set -e

source build/envsetup.sh
source vendor/lmodroid/build/envsetup.sh

# LMODroid/platform_bootable_deprecated-ota
repopick 20870
repopick 20871
repopick 20872

# LMODroid/platform_bootable_recovery
repopick 21178
repopick 21179
repopick 21180
repopick 21181
repopick 21182
repopick 21183
repopick 21184
repopick 21185
repopick 21186
repopick 21187
repopick 21188
repopick 21189
repopick 21190
repopick 21191
repopick 21192
repopick 21193
repopick 21194
repopick 21195
repopick 21196
repopick 21197
repopick 21198
repopick 21199
repopick 21200
repopick 21201
repopick 21202
repopick 21203
repopick 21204
repopick 21205
repopick 21206
repopick 21207
repopick 21208
repopick 21209
repopick 21210
repopick 21211
repopick 21212
repopick 21213
repopick 21214
repopick 21215
repopick 21216
repopick 21217
repopick 21218
repopick 21219
repopick 21220
repopick 21221
repopick 21222
repopick 21223
repopick 21224
repopick 21225
repopick 21226
repopick 21227
repopick 21228
repopick 21229
repopick 21230
repopick 21231
repopick 21232
repopick 21233
repopick 21234
repopick 21235
repopick 21236
repopick 21237
repopick 21238
repopick 21239
repopick 21240
repopick 21241
repopick 21242
repopick 21243
repopick 21244
repopick 21245
repopick 21246
repopick 21247
repopick 21248
repopick 21249
repopick 21250
repopick 21251
repopick 21252
repopick 21253
repopick 21254
repopick 21255
repopick 21256
repopick 21257
repopick 21258
repopick 21259
repopick 21260
repopick 21261
repopick 21262
repopick 21263
repopick 21264
repopick 21265
repopick 21266
repopick 21267
repopick 21268
repopick 21269
repopick 21270
repopick 21271
repopick 21272
repopick 21273
repopick 21274
repopick 21275
repopick 21276
repopick 21277
repopick 21278
repopick 21279
repopick 21280
repopick 21281
repopick 21282
repopick 21653

# LMODroid/platform_bionic
repopick 21410
repopick 21411
repopick 21412

# LMODroid/platform_build
cd build/make
git fetch https://gerrit.libremobileos.com/LMODroid/platform_build refs/changes/59/21359/1
git checkout FETCH_HEAD
cd ../..

# LMODroid/platform_build_soong
repopick 21364
repopick 21365
repopick 21366
repopick 21367
repopick 21368
repopick 21369
repopick 21370
repopick 21371
repopick 21372
repopick 21373
repopick 21374
repopick 21375
repopick 21376
repopick 21377
repopick 21378
repopick 21379
repopick 21380
repopick 21381
repopick 21382
repopick 21383
repopick 21384
repopick 21385
repopick 21386
repopick 21387
repopick 21388
repopick 21389
repopick 21390
repopick 21391
repopick 21392
repopick 21393
repopick 21394
repopick 21395
repopick 21396
repopick 21397
repopick 21398
repopick 21399
repopick 21400
repopick 21401
repopick 21402
repopick 21403
repopick 21404
repopick 21405
repopick 21406
repopick 21407
repopick 21408
repopick 21409
repopick 21663

# LMODroid-Devices/device_generic_common
repopick 21413

# LMODroid-Devices/device_generic_goldfish
repopick 21414
repopick 21415

# LMODroid-Devices/device_lmodroid_atv

# LMODroid/platform_device_lmodroid_sepolicy

# LMODroid/platform_device_mediatek_sepolicy_vndr
repopick 21795

# LMODroid/platform_development
repopick 20873

# LMODroid/platform_external_avb
repopick 20874
repopick 20875

# LMODroid/platform_external_dtc
repopick 20876
repopick 20877
repopick 20878
repopick 20879
repopick 20880
repopick 20881
repopick 20882
repopick 20883
repopick 20884
repopick 20885
repopick 20886
repopick 20887

# LMODroid/platform_external_e2fsprogs
# repopick 20888
repopick 20889
# repopick 20890

# LMODroid/platform_external_exfatprogs

# LMODroid/platform_external_federated-compute
repopick 20891

# LMODroid/platform_external_flatbuffers
repopick 20892

# LMODroid/platform_external_gptfdisk
repopick 20893
repopick 20894
repopick 20895
repopick 20896
repopick 20897
repopick 20898
repopick 20899

# LMODroid/platform_external_libremobileos-fonts_AlbertSans

# LMODroid/platform_external_libremobileos-fonts_Vazirmatn

# LMODroid/platform_external_mksh
repopick 20900
repopick 20901
repopick 20902

# LMODroid/platform_external_setupcompat
repopick 20903
repopick 20904
repopick 20905
repopick 20906
repopick 20907
repopick 20908
repopick 20909

# LMODroid/platform_external_svox
# repopick 21654

# LMODroid/platform_external_tensorflow
repopick 20910

# LMODroid/platform_external_tigervnc

# LMODroid/platform_external_tinycompress
repopick 20911
repopick 20912
repopick 20913
repopick 20914

# LMODroid/platform_external_wpa_supplicant_8
repopick 20915
repopick 20916

# LMODroid/platform_external_yifan

# LMODroid/platform_external_zstd
repopick 21416
repopick 21417

# LMODroid/platform_frameworks_av
repopick 21418
repopick 21419
repopick 21420
repopick 21421
repopick 21422
repopick 21423
repopick 21424
repopick 21425
repopick 21426
repopick 21427
repopick 21428
repopick 21429
repopick 21430
repopick 21431
repopick 21432
repopick 21433
repopick 21434
repopick 21435
repopick 21436
repopick 21437
repopick 21438
repopick 21439
repopick 21440
repopick 21441
repopick 21442
repopick 21443
repopick 21444
repopick 21445
repopick 21446
repopick 21447
repopick 21448

# LMODroid/platform_frameworks_base
cd frameworks/base
git fetch https://git.libremobileos.com/Dhina17/platform_frameworks_base sixteen-qpr0
git checkout FETCH_HEAD
cd ../..

# LMODroid/platform_frameworks_libs_systemui

# LMODroid/platform_frameworks_lmodroid
repopick 21657
repopick 21658

# LMODroid/platform_frameworks_native
repopick 21450
repopick 21451
repopick 21452
repopick 21453
repopick 21454
repopick 21455
repopick 21456
repopick 21457
repopick 21458
repopick 21459
repopick 21460
repopick 21461
repopick 21462
repopick 21463
repopick 21464
repopick 21465
repopick 21466
repopick 21467
repopick 21468
repopick 21469
repopick 21470
repopick 21471
repopick 21472

# LMODroid/platform_frameworks_opt_colorpicker
repopick 20917

# LMODroid/platform_frameworks_opt_telephony
repopick 21478
repopick 21479
repopick 21480
repopick 21481
repopick 21482
repopick 21483
repopick 21484
repopick 21485
repopick 21486

# LMODroid/platform_frameworks_opt_timezonepicker
repopick 20918
repopick 20919
repopick 20920

# LMODroid/platform_hardware_broadcom_libbt
repopick 20921
repopick 20922
repopick 20923
repopick 20924
repopick 20925
repopick 20926
repopick 20927
repopick 20928

# LMODroid/platform_hardware_google_camera
repopick 20929

# LMODroid/platform_hardware_google_pixel
repopick 20930
repopick 20931
repopick 20932
repopick 20933
repopick 20934
repopick 20935
repopick 20936
repopick 20937
repopick 20938
repopick 20939
repopick 20940
repopick 20941
repopick 20942
repopick 20943

# LMODroid/platform_hardware_interfaces
repopick 21487
repopick 21488
repopick 21489
repopick 21490
repopick 21491
repopick 21492
repopick 21493
repopick 21494
repopick 21495
repopick 21496
repopick 21497
repopick 21498
repopick 21499
repopick 21500
repopick 21501
repopick 21502
repopick 21503
repopick 21504

# LMODroid/platform_hardware_libhardware
repopick 20944
repopick 20945
repopick 20946

# LMODroid/platform_hardware_lmodroid

# LMODroid/platform_hardware_samsung_nfc
repopick 20947
repopick 20948

# LMODroid/platform_hardware_st_nfc
repopick 21505
repopick 21506
repopick 21507
repopick 21508

# LMODroid/platform_kernel_configs
repopick 20949
repopick 20950
repopick 20951
repopick 20952
repopick 20953
repopick 20954
repopick 20955
repopick 20956

# LMODroid/manifest
repopick 20868

# LMODroid/platform_packages_apps_Aperture

# LMODroid/platform_packages_apps_Backgrounds

# LMODroid/platform_packages_apps_Camera2
repopick 20957

# LMODroid/platform_packages_apps_Car_Settings

# LMODroid/platform_packages_apps_Car_SystemUI
repopick 21510

# LMODroid/platform_packages_apps_Contacts
repopick 20958
repopick 20959
repopick 20960
repopick 20961
repopick 20962
repopick 20963
repopick 20964
repopick 20965
repopick 20966
repopick 20967
repopick 20968
repopick 20969
repopick 20970
repopick 20971
repopick 20972
repopick 20973
repopick 20974
repopick 20975
repopick 20976
repopick 20977
repopick 20978
repopick 20979
repopick 20980
repopick 20981

# LMODroid/platform_packages_apps_DeskClock

# LMODroid/platform_packages_apps_DesktopMode

# LMODroid/platform_packages_apps_Dialer

# LMODroid/platform_packages_apps_DocumentsUI
repopick 21511
repopick 21512
repopick 21513
repopick 21514

# LMODroid/platform_packages_apps_EmergencyInfo
repopick 20982
repopick 20983

# LMODroid/platform_packages_apps_Etar

# LMODroid/platform_packages_apps_F-DroidPrivilegedExtension

# LMODroid/platform_packages_apps_FaceUnlock

# LMODroid/platform_packages_apps_FMRadio

# LMODroid/platform_packages_apps_FlipFlap

# LMODroid/platform_packages_apps_GameSpace

# LMODroid/platform_packages_apps_Glimpse

# LMODroid/platform_packages_apps_ImsServiceEntitlement
repopick 20984

# LMODroid/platform_packages_apps_LMODynamicWallpaper

# LMODroid/platform_packages_apps_LMOFreeform
repopick 21655

# LMODroid/platform_packages_apps_LMOSettings

# LMODroid/platform_packages_apps_LMOSystemUI
repopick 21656
repopick 21659
repopick 21660
repopick 21661

# LMODroid/platform_packages_apps_LMOSystemUIClock

# LMODroid/platform_packages_apps_Launcher3

# LMODroid/platform_packages_apps_ManagedProvisioning
repopick 20985
repopick 20986

# LMODroid/platform_packages_apps_Messaging
repopick 20987
repopick 20988
repopick 20989
repopick 20990
repopick 20991
repopick 20992
repopick 20993
repopick 20994
repopick 20995
repopick 20996
repopick 20997
repopick 20998
repopick 20999
repopick 21000
repopick 21001
repopick 21002
repopick 21003
repopick 21004
repopick 21005
repopick 21006
repopick 21007
repopick 21008
repopick 21009
repopick 21010
repopick 21011
repopick 21012
repopick 21013
repopick 21014
repopick 21015
repopick 21016
repopick 21017
repopick 21018
repopick 21019
repopick 21020
repopick 21021
repopick 21022
repopick 21023
repopick 21024
repopick 21025
repopick 21026
repopick 21027
repopick 21028
repopick 21029
repopick 21030
repopick 21031
repopick 21032
repopick 21033
repopick 21034
repopick 21035
repopick 21036

# LMODroid/platform_packages_apps_Music
repopick 21037
repopick 21038
repopick 21039

# LMODroid/platform_packages_apps_MusicFX
repopick 21040
repopick 21041
repopick 21042

# LMODroid/platform_packages_apps_OpenEUICC

# LMODroid/platform_packages_apps_ParallelSpace

# LMODroid/platform_packages_apps_QuickSearchBox
repopick 21043
repopick 21044

# LMODroid/platform_packages_apps_Recorder

# LMODroid/platform_packages_apps_Ripple

# LMODroid/platform_packages_apps_Settings
repopick 21664
repopick 21665
repopick 21666
repopick 21667
repopick 21668
repopick 21669
repopick 21670
repopick 21671
repopick 21672
repopick 21673
repopick 21674
repopick 21675
repopick 21676
repopick 21677
repopick 21678
repopick 21679
repopick 21680
repopick 21681
repopick 21682
repopick 21683
repopick 21684
repopick 21685
repopick 21686
repopick 21687
repopick 21688
repopick 21689
repopick 21690
repopick 21691
repopick 21692
repopick 21693
repopick 21694
repopick 21695
repopick 21696
repopick 21697
repopick 21698
repopick 21699
repopick 21700
repopick 21701
repopick 21702
repopick 21703
repopick 21704
repopick 21705
repopick 21706
repopick 21707
repopick 21708
repopick 21709
repopick 21710
repopick 21711
repopick 21712
repopick 21713
repopick 21714
repopick 21715
repopick 21716
repopick 21717
repopick 21718
repopick 21719
repopick 21720
repopick 21721
repopick 21722
repopick 21723
repopick 21724
repopick 21725
repopick 21726
repopick 21727
repopick 21728
repopick 21729
repopick 21730
repopick 21731
repopick 21732
repopick 21733
repopick 21734
repopick 21735
repopick 21736
repopick 21737
repopick 21738
repopick 21739
repopick 21740
repopick 21741
repopick 21742
repopick 21743
repopick 21744
repopick 21745
repopick 21746
repopick 21747
repopick 21748
repopick 21749
repopick 21750
repopick 21751
repopick 21752
repopick 21753
repopick 21754
repopick 21755
repopick 21756
repopick 21757
repopick 21758
repopick 21759
repopick 21760
repopick 21761
repopick 21762
repopick 21763
repopick 21764
repopick 21765
repopick 21766
repopick 21767
repopick 21768
repopick 21769
repopick 21770
repopick 21771
repopick 21772
repopick 21773
repopick 21774
repopick 21775
repopick 21776
repopick 21777
repopick 21778
repopick 21779
repopick 21780
repopick 21781
repopick 21782
repopick 21783
repopick 21784
repopick 21785
repopick 21786
repopick 21787
repopick 21788
repopick 21789
repopick 21790
repopick 21791
repopick 21792
repopick 21793
repopick 21794

# LMODroid/platform_packages_apps_SettingsIntelligence
repopick 21045
repopick 21046
repopick 21047

# LMODroid/platform_packages_apps_SetupWizard

# LMODroid/platform_packages_apps_ThemePicker
repopick 21515
repopick 21516
repopick 21517
repopick 21518
repopick 21519
repopick 21520
repopick 21521
repopick 21522
repopick 21523
repopick 21524
repopick 21525
repopick 21526
repopick 21527
repopick 21528
repopick 21529

# LMODroid/platform_packages_apps_TouchGestures

# LMODroid/platform_packages_apps_TvSettings

# LMODroid/platform_packages_apps_TvSystemUI

# LMODroid/platform_packages_apps_Updater

# LMODroid/platform_packages_apps_WallpaperPicker2
repopick 21048
repopick 21049

# LMODroid/platform_packages_inputmethods_LatinIME
repopick 21050
repopick 21051
repopick 21052
repopick 21053
repopick 21054
repopick 21055
repopick 21056
repopick 21057
repopick 21058
repopick 21059
repopick 21060
repopick 21061
repopick 21062
repopick 21063
repopick 21064
repopick 21065
repopick 21066
repopick 21067
repopick 21068
repopick 21069
repopick 21070
repopick 21071
repopick 21072
repopick 21073
repopick 21074
repopick 21075
repopick 21076
repopick 21077
repopick 21078
repopick 21079
repopick 21080
repopick 21081
repopick 21082
repopick 21083
repopick 21084
repopick 21085
repopick 21086
repopick 21087
repopick 21088
repopick 21089
repopick 21090
repopick 21091
repopick 21092
repopick 21093
repopick 21094
repopick 21095
repopick 21096
repopick 21097
repopick 21098
repopick 21099
repopick 21100
repopick 21101
repopick 21102
repopick 21103
repopick 21104
repopick 21105
repopick 21106
repopick 21107
repopick 21108
repopick 21109
repopick 21110
repopick 21111
repopick 21112
repopick 21113
repopick 21114
repopick 21115
repopick 21116
repopick 21117
repopick 21118
repopick 21119
repopick 21120
repopick 21121
repopick 21122
repopick 21123
repopick 21124
repopick 21125
repopick 21126
repopick 21127
repopick 21128
repopick 21129
repopick 21130
repopick 21131

# LMODroid/platform_packages_modules_adb
repopick 21132
repopick 21133
repopick 21134

# LMODroid/platform_packages_modules_Bluetooth
repopick 21530
repopick 21531
repopick 21532
repopick 21533
repopick 21534
repopick 21535

# LMODroid/platform_packages_modules_Connectivity
repopick 21536
repopick 21537
repopick 21538
repopick 21539
repopick 21540
repopick 21541
repopick 21542
repopick 21543
repopick 21544
repopick 21545
repopick 21546
repopick 21547

# LMODroid/platform_packages_modules_common
repopick 21135
repopick 21136

# LMODroid/platform_packages_modules_microG

# LMODroid/platform_packages_modules_Permission
repopick 21548
repopick 21549
repopick 21550

# LMODroid/platform_packages_modules_Wifi
repopick 21137

# LMODroid/platform_packages_overlays_LMODroid

# LMODroid/platform_packages_providers_DownloadProvider
repopick 21138
repopick 21139

# LMODroid/platform_packages_providers_MediaProvider
repopick 21551
repopick 21552

# LMODroid/platform_packages_resources_devicesettings

# LMODroid/platform_packages_services_Car

# LMODroid/platform_packages_services_DeviceAsWebcam
repopick 21140
repopick 21141

# LMODroid/platform_packages_services_LMOStats

# LMODroid/platform_packages_services_Mms
repopick 21142

# LMODroid/platform_packages_services_Telecomm
repopick 21553
repopick 21554
repopick 21555
repopick 21556
repopick 21557
repopick 21558

# LMODroid/platform_packages_services_Telephony
repopick 21143
repopick 21144
repopick 21145
repopick 21146
repopick 21147

# LMODroid/platform_packages_services_VncFlinger

# kernel/prebuilts/build-tools

# LMODroid/platform_prebuilts_lmodroid

# LMODroid/platform_system_bpf
repopick 21148
repopick 21149
repopick 21150
repopick 21151

# LMODroid/platform_system_chre
repopick 21152

# LMODroid/platform_system_core
repopick 21559
repopick 21560
repopick 21561
repopick 21562
repopick 21563
repopick 21564
repopick 21565
repopick 21566
repopick 21567
repopick 21568
repopick 21569
repopick 21570
repopick 21571
repopick 21572
repopick 21573
repopick 21574
repopick 21575
repopick 21576
repopick 21577
repopick 21578
repopick 21579
repopick 21580
repopick 21581
repopick 21582
repopick 21583
repopick 21584
repopick 21585
repopick 21586
repopick 21587
repopick 21588
repopick 21589
repopick 21590
repopick 21591

# LMODroid/platform_system_extras
repopick 21153
repopick 21154
repopick 21155

# LMODroid/platform_system_keymaster
repopick 21156

# LMODroid/platform_system_libhidl
repopick 21157

# LMODroid/platform_system_libziparchive
repopick 21158

# LMODroid/platform_system_logging
repopick 21159
repopick 21160

# LMODroid/platform_system_media
repopick 21161

# LMODroid/platform_system_netd
repopick 21162
repopick 21163
repopick 21164
repopick 21165
repopick 21166

# LMODroid/platform_system_security
repopick 21167

# LMODroid/platform_system_sepolicy
repopick 21592
repopick 21593
repopick 21594
repopick 21595
repopick 21596
repopick 21597
repopick 21598
repopick 21599
repopick 21600
repopick 21601
repopick 21602
repopick 21603

# LMODroid/platform_system_tools_mkbootimg
repopick 21168

# LMODroid/platform_system_update_engine
repopick 21169
repopick 21170
repopick 21171
repopick 21172
repopick 21173
repopick 21174
repopick 21175
repopick 21176

# LMODroid/platform_system_vold
repopick 21604
repopick 21605
repopick 21606
repopick 21607
repopick 21608
repopick 21609
repopick 21610
repopick 21611
repopick 21612
repopick 21613
repopick 21614
repopick 21615
repopick 21616
repopick 21617
repopick 21618
repopick 21619

# LMODroid/platform_vendor_lmodroid
repopick 21620
repopick 21621
repopick 21622
repopick 21623
repopick 21624
repopick 21625
repopick 21626
repopick 21627
repopick 21628
repopick 21629
repopick 21630
repopick 21631
repopick 21632
repopick 21633
repopick 21634
repopick 21635
repopick 21636
repopick 21662

# LMODroid/platform_vendor_support
