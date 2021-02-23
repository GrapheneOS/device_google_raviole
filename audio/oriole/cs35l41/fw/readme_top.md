# Tune info for 20210122_Top_Protect

### Tune Details

Initial excursion and thermal protect tune for O6 top speaker.

- **Tune name**: o6Top_pb6.45.0_protect_17.5dB_withRtrace_20210122.bin
- **Tune sha1sum**: 242794f783009782dbd56fd087a6680bb3de6886
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

- o6Top_pb6.45.0_protect_17.5dB_withRtrace_20210122.bin (sha1sum: 242794f783009782dbd56fd087a6680bb3de6886)
- o6_17.5db_cal_top.bin (sha1sum: b8605e11c6f2b249839e37a13e51490e51da8277)
- o6_17.5db_cal_diag_top.bin (sha1sum: 6be1f1674c0a192827aac8332ec079ec0f70dae1)

**Protect & Calibration files without R trace**
 _For use on Lochnagar 2 development platform_
 _JSON files contain both protect and calibration deploy groups_

- o6TopProtect_pb6.45.0_17.5db_noRTrace_20210122.json (sha1sum: 2bd350728547e9a64184b7c17597d01aa0f4ae7e)

**Labsuite Files**

- o6Top_pb6.45.0_protect_17.5dB_noRtrace_20210122.exported_tuning (sha1sum: 959ab6987d644d21546482f02b4f1afdc815c37c)
- o6Top_pb6.45.0_protect_17.5dB_withRtrace_20210122.exported_tuning (sha1sum: 522834bb9bff36c55ab8d59d69403eb818c3e8ef)

### O6 top speaker tune parameters

| PARAMETER                           | VALUE       |
| ----------------------------------- | ----------- |
| **IEC Rated Noise Power (nominal)** | 1 [W]       |
| **Xmax (0-Peak)**                   | 0.45 [mm]   |
| **Maximum Coil Temperature (Tmax)** | 130 [C]     |
| **Coil co-efficiency (Tk)**         | 0.00393     |
| **DC Resistance**                   | 6 [Ohms]    |
| **ReDC Delta Max**                  | +/-10%      |
| **RTrace**                          | 300 [mOhms] |
