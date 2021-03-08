# R4 Protect Tune - Top And Bottom Speakers

## Tune Details

- **File name**:
  - _Device_: CS35L41 revB2
  - _Firmware Version_
    - _Protect_: Playback 6.45.0
    - _Calibration_: Playback 6.39.0
    - _Diagnostics_: Playback 6.39.0
  - _Signal Chain_:
    - _Protect_: Protect Lite
    - _Calibration_: Calibration
    - _Diagnostics_: Calibration and Diagnostics
- **Amplifier Gain**: 17.5dB

### Changelog

#### 21.2.0

- Initial protect tune

### Included files

**Readme (This file)**

- readme.md

**Protect, Calibration, and Diag bins with R Trace**
 _For use in actual phone_

- Top\r4Top_protect_21.02.0_pb6.45.0_17.5dB_withRTrace.bin
- Top\r4Top_cal_21.2.0_pb6.39.0_17.5dB.bin
- Top\r4Top_calAndDiag_21.2.0_pb6.39.0_17.5dB.bin
- Bottom\r4Bottom_protect_21.02.0_pb6.45.0_17.5dB_withRTrace.bin
- Bottom\r4Bottom_cal_21.2.0_pb6.39.0_17.5dB.bin
- Bottom\r4Bottom_calAndDiag_21.2.0_pb6.39.0_17.5dB.bin

**Protect & Calibration files without R trace**
 _For use on Lochnagar 2 development platform_

- Top\r4Top_21.02.0_pb6.45.0_17.5dB_noRTrace.json
- Bottom\r4Bottom_21.02.0_pb6.45.0_17.5dB_noRTrace.json

_JSON files contains both protect and calibration deploy groups_

**Labsuite Files**

- Top\r4Top_protect_21.02.0_pb6.45.0_17.5dB_withRTrace.exported_tuning
- Bottom\r4Bottom_protect_21.02.0_pb6.45.0_17.5dB_withRTrace.exported_tuning

**Firmware Files**
_Each firmware wmfw is in a folder respective for which type of bin file it is for_

- Firmware\Cal\halo_cspl_RAM_revB2_29.41.0.wmfw
- Firmware\Diag\halo_cspl_RAM_diag_revB2_29.41.0.wmfw
- Firmware\Protect\halo_cspl_RAM_revB2_29.47.0.wmfw

---

## Speaker Parameters

### Top Speaker

| PARAMETER                           | VALUE            |
| ----------------------------------- | ---------------- |
| **IEC Rated Noise Power (nominal)** | 1 [W]            |
| **Xmax (0-Peak)**                   | 0.45 [mm]        |
| **Maximum Coil Temperature (Tmax)** | 130 [C]          |
| **Coil co-efficiency (Tk)**         | 0.00393          |
| **DC Resistance**                   | 6 [Ohms]         |
| **Resonance Frequency**             | 810 [Hz] +/-7.5% |

### Bottom Speaker

| PARAMETER                           | VALUE                 |
| ----------------------------------- | --------------------- |
| **IEC Rated Noise Power (nominal)** | 1.14 [W]              |
| **Xmax (0-Peak)**                   | 0.55 [mm]             |
| **Maximum Coil Temperature (Tmax)** | 110 [C]               |
| **Coil co-efficiency (Tk)**         | 0.00393               |
| **DC Resistance**                   | 6.15+/-0.5[Ohm]       |
| **Resonance Frequency**             | 630 [Hz] +/- 10% [Hz] |
