# Tune info for 20210122_Bottom_Protect

### Tune Details

Initial excursion and thermal protect tune for O6 speaker.

- **Tune name**: o6Bottom_pb6.45.0_protect_17.5dB_withRtrace_20210122.bin
- **Tune sha1sum**: 5942bb9e424156465d727277ebd4e57a8e162cd6
- **Playback Version**: 6.45.0
  - _Device_: CS35L41B revB2
  - _Firmware Version_: halo_cspl_RAM_revB2_29.47.0.wmfw
  - _Firmware sha1sum_: 0c8206f80498dcfa7649dc5e268d5a4013422c09
  - _Signal Chain_: Protect Lite Mono
- **Amplifier Gain**: 17.5dB

### Changelog

#### 20210122

- Playback Version 6.43.0 → 6.45.0

#### 20201130

- Initial Tune

### Included files

**Readme (this file)**

- readme.md

**CS35L41B DSP Firmware**

- halo_cspl_RAM_revB2_29.47.0.wmfw (sha1sum: 0c8206f80498dcfa7649dc5e268d5a4013422c09)
- halo_cspl_RAM_revB2_29.41.0.wmfw (sha1sum: bbc639b863e7235eb20a85f9097257828a424e0d)
- halo_cspl_RAM_diag_revB2_29.41.0.wmfw (sha1sum: 7f5ffcb9e0d2eb0cc778327a48034703a817d6bd)

**Protect & Calibration & Diagnostics files with R trace**
 _For use in actual phone_

- o6Bottom_pb6.45.0_protect_17.5dB_withRtrace_20210122.bin (sha1sum: 5942bb9e424156465d727277ebd4e57a8e162cd6)
- o6_17.5db_cal_bottom.bin (sha1sum: a9a445468760dfaf78ee83803978e754fda67a1d)
- o6_17.5db_cal_diag_bottom.bin (sha1sum: fdfa5f5725af8b8733d18a9ac2f0c1fbfccce705)

**Protect & Calibration files without R trace**
 _For use on Lochnagar 2 development platform_
 _JSON files contain both protect and calibration deploy groups_

- o6BottomProtect_pb6.45.0_17.5db_noRTrace_20210122.json (sha1sum: 559dd989872f425fa021e123a761bbbaa64e044e)

**Labsuite Files**

- o6Bottom_pb6.45.0_protect_17.5dB_noRtrace_20210122.exported_tuning (sha1sum: 11ed0f4d0bd9db2bf36138ba54f379dd5127d5bc)
- o6Bottom_pb6.45.0_protect_17.5dB_withRtrace_20210122.exported_tuning (sha1sum: ee4bc698cca1ee5dc40cfe3f419b9505da7a32de)

### O6 Bottom speaker tune parameters

| PARAMETER                           | VALUE       |
| ----------------------------------- | ----------- |
| **IEC Rated Noise Power (nominal)** | 1 [W]       |
| **Xmax (0-Peak)**                   | 0.4 [mm]    |
| **Maximum Coil Temperature (Tmax)** | 120 [C]     |
| **Coil co-efficiency (Tk)**         | 0.00346     |
| **DC Resistance**                   | 6.9 [Ohms]  |
| **ReDC Delta Max**                  | +/-10%      |
| **RTrace**                          | 300 [mOhms] |
