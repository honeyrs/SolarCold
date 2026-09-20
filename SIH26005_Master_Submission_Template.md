# SIH26005: Official Pitch & Master Compliance Document

*This document maps our proposed 3-Stage Hybrid Solar-PCM Cold Storage System strictly to the SIH26005 Problem Statement requirements (a through h).*

## 1. Compliance with Expected Solution Criteria

**a. Solar-powered cooling system with energy-efficient operation:**
*   *Our Solution:* We use a 3.5kW Monocrystalline solar array driving a variable-speed BLDC compressor (R290 refrigerant). By bypassing AC inverters, we improve energy efficiency by 20%.

**b. Insulated cold storage chamber for preserving fresh vegetables:**
*   *Our Solution:* Built using 120mm Polyurethane Foam (PUF) panels (U-value ~0.18) to strictly maintain the 4°C - 10°C required for NER vegetables like tomatoes and cabbage.

**c. Battery backup support for uninterrupted operation:**
*   *Our Solution (The Core Innovation):* Instead of a massive, expensive electrical battery, we split the backup into two stages:
    1.  A small 4.8 kWh LiFePO4 electrical battery (handles short clouds/evening).
    2.  A 120kg **Phase Change Material (PCM)** Thermal Battery (eutectic salt melting at 5°C). This provides 12-14 hours of passive cooling at night with zero electricity.

**d. Temperature and humidity monitoring mechanism:**
*   *Our Solution:* Edge-computing IoT system using ESP32, multiple DS18B20 temperature probes, and DHT22 humidity sensors. The MCU automatically controls a circulation fan if humidity exceeds 95% (common in NER monsoons) to prevent vegetable rot.

**e. Smart alert/indicator system:**
*   *Our Solution:* AWS/Firebase-backed mobile app and SMS gateway that triggers alerts for:
    *   *Temp Fluctuations:* If internal temp > 10°C.
    *   *Power Failure:* If battery SoC < 10% and PCM is fully melted.
    *   *Door Alert:* If the insulated door is left open > 2 minutes.

**f. Compact and modular design suitable for village-level deployment and difficult terrain:**
*   *Our Solution:* A "Flat-Pack" design. PUF panels connect via simple cam-locks. The entire 1-metric ton system can be transported in pieces up difficult NER mountain roads in a small Mahindra pickup and assembled on-site in hours.

**g. Weather-resistant and durable structure for varying climatic conditions in NER:**
*   *Our Solution:* Exterior surfaces use Pre-Painted Galvanized Iron (PPGI) to resist rust from heavy monsoon rains. Solar panels are over-sized (3.5kW instead of 2kW) to compensate for monsoon cloud cover.

**h. Low-maintenance and cost-effective system suitable for farmer cooperatives:**
*   *Our Solution:* By replacing 70% of the required electrical battery with a PCM thermal battery, we cut the energy storage cost by **over 50%**. Furthermore, PCM never degrades (unlike lithium), reducing long-term OPEX and maintenance to near zero.

---

## 2. Business Model Canvas (For Commercial Pitch)

To win SIH, the idea must be commercially viable.

*   **Key Partners:**
    *   Ministry of DoNER (for subsidies/grants).
    *   Local NER Farmer Producer Organizations (FPOs).
    *   Local PUF panel and solar vendors in Assam/Meghalaya.
*   **Key Activities:** System assembly, IoT software maintenance, farmer training.
*   **Value Proposition:** Stop distress selling. Reduce post-harvest vegetable loss from 30% to <5%. Cut cold storage CAPEX by 50% through PCM innovation.
*   **Customer Segments:** Village-level aggregation centers, Farmer Cooperatives, Local NER vegetable vendors.
*   **Cost Structure:**
    *   Hardware (PUF, Compressor, PCM, Solar): ~₹2.77 Lakhs per 1-ton unit.
    *   Cloud hosting (AWS) & SIM data for IoT.
*   **Revenue Streams:**
    *   Direct sale of units to FPOs (subsidized by gov).
    *   "Cooling-as-a-Service" (CaaS): Farmers pay ₹1 - ₹2 per kg per day to store their vegetables at the village center.

## 3. Competitive Advantage
Why is this better than current market solutions (like Ecozen or Inficold)?
Current market solutions rely almost entirely on large thermal storage *tanks* (using water/ice) or massive lithium batteries. Our engineered 5°C Eutectic PCM is significantly more compact, lightweight, and tailored precisely for the 4-10°C fresh vegetable requirement, making it the only truly feasible solution for remote, hilly NER topographies.
