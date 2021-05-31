# O6 Protect Tune - Top and Bottom Speakers

## Tune Details

- **File name**:
  - _Device_: CS35L41 revB2
  - _Firmware Version_
    - _Protect_: Playback 6.47.0
    - _Calibration_: Playback 6.47.0
    - _Diagnostics_: Playback 6.47.0
  - _Signal Chain_:
    - _Protect_: Protect Lite
    - _Calibration_: Calibration
    - _Diagnostics_: Calibration and Diagnostics
- **Amplifier Gain**: 17.5dB

### Changelog

#### 20210513_120hpf - PB6.47.0

- Recharacterized and retuned with EVT Bucks
  - **Top**: 5 samples (3 new ones + 2 from 20210323)
  - **Bottom**: Same 3 samples as 20210323
- Updated ReDC fallback per customer request.
  - **Top**: 5.471 Ohms
  - **Bottom**: 6.383 Ohms
- Cal and Cal+Diag bin versions remain unchanged from 20210323 as these parameters have not been modified.

#### 20210329_120hpf - PB6.47.0

- Top speaker incorrectly had hpf as 150hz. Corrected fcutoff parameter on top speaker protect tunes.
  - All other files same as _20210323 - PB6.47.0_
- Renamed package and protect tune naming convention to match accompanying 20210329_150hpf tune package.

#### 20210323 - PB6.47.0

- Recharacterized and retuned with EVT Bucks (3 samples each Buck)
  - Bottom Speaker
    - **xmax**: 0.4mm
    - **tmax**: 120C
    - **hpf**: 120Hz
  - Top Speaker
    - **xmax**: 0.45mm
    - **tmax**: 130C
    - **hpf**: 120Hz
- Updates to firmware from 6.45.0 to 6.47.0
  - Implemented a timeout feature that allows a maximum delay between the start of the BCLK and the start of the LRCLK. If the timeout is exceeded, an error notification is sent to the driver and the command is ignored. This addresses a host-side timing issue for these signals that could lead to a no-audio situation.
  - Fixed an issue where repeated pause/resume commands could cause pops on the output.

#### 20210319 - PB6.45.0

- Lowered tmax and xmax limits per customer request
  - Top Speaker
    - **xmax**: 0.4mm -> 0.3mm
    - **tmax**: 120C -> 110C
    - **hpf**: 150Hz (Unchanged)
  - Bottom Speaker
    - **xmax**: 0.45mm -> 0.35mm
    - **tmax**: 130C -> 120C
    - **hpf**: 150Hz (Unchanged)

#### 20210122 - PB6.45.0

- Recompiled 20201221 tune for PB 6.45.0. No changes to tune.

#### 20201221

- Initial Tune

---

### Included Files

**Readme (This file)**

- readme.md

**Protect, Calibration, and Diag bins with R Trace**  
_For use in actual phone_

- Bottom\o6Bottom_calAndDiag_20210323_pb6.47.0_17.5dB_withRtrace.bin
- Bottom\o6Bottom_cal_20210323_pb6.47.0_17.5dB_withRtrace.bin
- Bottom\o6Bottom_protect_20210513_120hpf_pb6.47.0_17.5dB_withRtrace.bin
- Top\o6Top_calAndDiag_20210323_pb6.47.0_17.5dB_withRTrace.bin
- Top\o6Top_cal_20210323_pb6.47.0_17.5dB_withRTrace.bin
- Top\o6Top_protect_20210513_120hpf_pb6.47.0_17.5dB_withRTrace.bin

**Protect & Calibration files without R trace**  
_For use on Lochnagar 2 development platform_  
_JSON files contains both protect and calibration deploy groups_

- Bottom\o6Bottom_protect_20210513_120hpf_pb6.47.0_17.5dB_noRTrace.json
- Top\o6Top_protect_20210513_120hpf_pb6.47.0_17.5dB_noRTrace.json

**Labsuite Files**

- Bottom\o6Bottom_protect_20210513_120hpf_pb6.47.0_17.5dB_noRtrace.exported_tuning
- Bottom\o6Bottom_protect_20210513_120hpf_pb6.47.0_17.5dB_noRtrace.parameters
- Bottom\o6Bottom_protect_20210513_120hpf_pb6.47.0_17.5dB_withRtrace.exported_tuning
- Bottom\o6Bottom_protect_20210513_120hpf_pb6.47.0_17.5dB_withRtrace.parameters
- Top\o6Top_protect_20210513_120hpf_pb6.47.0_17.5dB_noRtrace.exported_tuning
- Top\o6Top_protect_20210513_120hpf_pb6.47.0_17.5dB_noRtrace.parameters
- Top\o6Top_protect_20210513_120hpf_pb6.47.0_17.5dB_withRtrace.exported_tuning
- Top\o6Top_protect_20210513_120hpf_pb6.47.0_17.5dB_withRtrace.parameters

**Firmware Files**  
_Each firmware wmfw is in a folder respective for which type of bin file it is for_

- Firmware\Cal\halo_cspl_RAM_revB2_29.49.0.wmfw
- Firmware\Diag\halo_cspl_RAM_diag_revB2_29.49.0.wmfw
- Firmware\Protect\halo_cspl_RAM_revB2_29.49.0.wmfw

**Tune Reports**

- CustomerTuneReports\o6Bottom_20210519_120_hpf_6.47_CustomerTuneReport.pdf
- CustomerTuneReports\o6Top_20210519_120hpf_6.47_CustomerTuneReport.pdf

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
| **Resonance Frequency**             | 780 [Hz] +/-10 % |
| **RTrace**                          | 0.3 [Ohms]       |
| **ReDC Max Delta**                  | 0.6 [Ohms]       |
| **ReDC Fallback Value**             | 5.471 [Ohms]     |

### Bottom Speaker

| PARAMETER                           | VALUE               |
| ----------------------------------- | ------------------- |
| **IEC Rated Noise Power (nominal)** | 1 [W]               |
| **Xmax (0-Peak)**                   | 0.4 [mm]            |
| **Maximum Coil Temperature (Tmax)** | 120 [C]             |
| **Coil co-efficiency (Tk)**         | 0.00346             |
| **DC Resistance**                   | 6.9 [Ohms]          |
| **Resonance Frequency**             | 890 [Hz] +/-80 [Hz] |
| **RTrace**                          | 0.3 [Ohms]          |
| **ReDC Max Delta**                  | 0.69 [Ohms]         |
| **ReDC Fallback Value**             | 6.383 [Ohms]        |
