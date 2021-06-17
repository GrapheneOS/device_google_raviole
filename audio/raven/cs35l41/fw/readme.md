# R4 Protect Tune - Top And Bottom Speakers Build 21.6.0

## Tune Details

- **File name**: r4_21.6.0
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

#### 21.6.0

- Top Speaker protect tune 21.5.0 → 21.6.0
  - Recharacterized and retuned to include new limit samples
  - Wael retuned XMAX gain to -24.3 (from -24.5) for slightly safer XMAX

#### 21.5.1

- Bottom speaker protect tune uprev 21.5.0 → 21.5.1
  - Recharacterized and retuned to include new limit samples
- All top speaker tunes remain the same as in 21.5.0

#### 21.5.0

- Updated 21.4.0_withWaelTuning with redc fallback values per customer request.
  - **Top**: 5.402 ohms
  - **Bottom**: 5.445 ohms
- This change in in the protect bins only. Cal and CalAndDiag bins remain the same as in 21.2.4.0_withWaelTuning

#### 21.4.0_withWaelTuning

Updated Top Tuning xmax parameters by Wael
No changes to bottom

#### 21.4.0

Retune using R4 EVT samples.
Firmware moved to 6.47.0 for protect, calibration, and diagnostics signal chains.

Changes in firmware between 6.45.0 and 6.47.0:

- Implemented a timeout feature that allows a maximum delay between the start of the BCLK and the start of the LRCLK.
  If the timeout is exceeded, an error notification is sent to the driver and the command is ignored. This addresses a
  host-side timing issue for these signals that could lead to a no-audio situation.
- Fixed an issue where repeated pause/resume commands could cause pops on the output.

#### 21.2.3_ENG

Based on 21.2.2_ENG with HPF cutoff frequencies set to 150Hz for both top and bottom protect tunes

- Top speaker protect tune uprev 21.02.2eng → 21.02.3eng
- Bottom speaker protect tune uprev 21.02.0 → 21.02.1
- All other files same as 21.2.2_ENG

#### 21.2.2_ENG

- Engineering build with Tmax of top protect tune fix in place. This is intended to resolve the overshoot issues seen in
  21.2.0 but withthout the de-margin of Tmax that was done in 21.2.1
- All other files same as 21.2.0

#### 21.2.1

- Updated Top thermal protect tune after reports of exceeding Tmax
- All other files same as 21.2.0

#### 21.2.0

- Initial protect tune

### Included files

**Readme (This file)**

- readme.md

**Protect, Calibration, and Diag bins with R Trace**  
 _For use in actual phone_

- #### Top Speaker
  - Top\r4Top_calAndDiag_21.4.0_pb6.47.0_17.5dB_withRTrace.bin
  - Top\r4Top_cal_21.4.0_pb6.47.0_17.5dB_withRTrace.bin
  - Top\21.6.0_100hpf\r4Top_protect_21.6.0_pb6.47.0_17.5dB_100hpf_withRTrace.bin
- #### Bottom Speaker
  - Bottom\r4Bottom_calAndDiag_21.4.0_pb6.47.0_17.5dB_withRTrace.bin
  - Bottom\r4Bottom_cal_21.4.0_pb6.47.0_17.5dB_withRTrace.bin
  - Bottom\21.5.1_100hpf\r4Bottom_protect_21.5.1_pb6.47.0_17.5dB_100hpf_withRTrace.bin

**Protect & Calibration jsons without R trace**  
 _For use on Lochnagar 2 development platform_

- #### Top Speaker
  - Top\21.6.0_100hpf\r4Top_21.6.0_pb6.47.0_17.5dB_100hpf_noRTrace.json
- #### Bottom Speaker
  - Bottom\21.5.1_100hpf\r4Bottom_21.5.1_pb6.47.0_17.5dB_100hpf_noRTrace.json

_JSON files contains both protect and calibration deploy groups_

**Labsuite Files**

- #### Top Speaker
  - Top\21.6.0_100hpf\r4Top_21.6.0_pb6.47.0_17.5dB_100hpf_noRTrace.exported_tuning
  - Top\21.6.0_100hpf\r4Top_21.6.0_pb6.47.0_17.5dB_100hpf_withRTrace.exported_tuning
- #### Bottom Speaker
  - Bottom\21.5.1_100hpf\r4Bottom_21.5.1_pb6.47.0_17.5dB_100hpf_noRTrace.parameters
  - Bottom\21.5.1_100hpf\r4Bottom_21.5.1_pb6.47.0_17.5dB_100hpf_withRTrace.parameters
  - Bottom\21.5.1_100hpf\r4Bottom_protect_21.5.1_pb6.47.0_17.5dB_100hpf_noRTrace.exported_tuning
  - Bottom\21.5.1_100hpf\r4Bottom_protect_21.5.1_pb6.47.0_17.5dB_100hpf_withRTrace.exported_tuning

**Firmware Files**  
_Each firmware wmfw is in a folder respective for which type of bin file it is for_

- Firmware\Cal\halo_cspl_RAM_revB2_29.49.0.wmfw
- Firmware\Diag\halo_cspl_RAM_diag_revB2_29.49.0.wmfw
- Firmware\Protect\halo_cspl_RAM_revB2_29.49.0.wmfw

**Additional data**

- r4EvtSpeakerCalAndDiagResults.xlsx
- CustomerTuneReports\R4_21.5.1_Bottom_CustomerTuneReport.pdf
- CustomerTuneReports\R4_21.6.0_Top_CustomerTuneReport.pdf

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
| **Resonance Frequency**             | 820 [Hz] +/-7.5% |
| **ReDC Fallback**                   | 5.402 ohms       |

### Bottom Speaker

| PARAMETER                           | VALUE                 |
| ----------------------------------- | --------------------- |
| **IEC Rated Noise Power (nominal)** | 1.14 [W]              |
| **Xmax (0-Peak)**                   | 0.55 [mm]             |
| **Maximum Coil Temperature (Tmax)** | 110 [C]               |
| **Coil co-efficiency (Tk)**         | 0.00393               |
| **DC Resistance**                   | 6.1[Ohm]              |
| **Resonance Frequency**             | 720 [Hz] +/- 10% [Hz] |
| **ReDC Fallback**                   | 5.445 ohms            |
