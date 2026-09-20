# SIH26005: Real-World Location Case Study - Jorhat, Assam

To prove the viability of the 3-Stage Solar-PCM Cold Storage System, we have selected a specific, high-impact location within the North Eastern Region (NER) to apply real-world climatic and agricultural data to our system model.

## 1. Selected Location: Jorhat, Assam
*   **Coordinates:** 26.75° N, 94.21° E
*   **Elevation:** ~116 meters
*   **Significance:** Jorhat is a major agricultural hub in Assam, known for producing tomatoes, cabbage, and various leafy vegetables. It represents a typical NER environment: high humidity, significant monsoon rainfall, and frequent grid power instability.

## 2. Climatic Data & Challenges (Annual Averages)
*   **Average Summer Peak Temperature (April-June):** 33°C to 36°C
*   **Average Winter Low Temperature (Dec-Jan):** 9°C to 12°C
*   **Average Relative Humidity:** 75% to 85% (Reaches 95%+ during monsoon)
*   **Average Solar Irradiance (GHI):** ~4.5 to 5.0 kWh/m²/day (Lower than western India, drops significantly during the monsoon season from June to September).

## 3. System Adjustments based on Jorhat Data

### A. Solar PV Sizing for Monsoon Resilience
In western India, a 1-ton cold storage might only need 2 kW of solar panels. However, in Jorhat during the monsoon (July), solar irradiance can drop to **2.5 kWh/m²/day** due to heavy cloud cover.
*   *Action:* We must **oversize the solar array by 50%**. We will install **3 kW to 3.5 kW** of Monocrystalline PERC solar panels.
*   *Reasoning:* Monocrystalline PERC panels perform significantly better in low-light and diffuse-light (cloudy) conditions compared to standard Polycrystalline panels. Even on a rainy day, the 3.5 kW array can generate the ~1.5 kW needed to run the variable-speed compressor and keep the PCM frozen.

### B. PCM (Phase Change Material) Optimization for Assam Nights
During summer nights in Jorhat, the ambient temperature remains warm (around 26°C - 28°C).
*   *Heat Load recalculation:* The transmission heat load at night is higher here than in high-altitude areas like Tawang (Arunachal Pradesh).
*   *Action:* We increase the PCM mass from our baseline of 100 kg to **120 kg of Eutectic Salt (5°C melt)**.
*   *Reasoning:* This guarantees a full 14 hours of passive cooling, ensuring that even if there is a complete power grid failure and a heavily clouded morning, the vegetables remain safe at 5°C until the sun breaks through in the late afternoon.

### C. Humidity Management (IoT Sensor Focus)
Jorhat is extremely humid. While vegetables like high humidity, if it hits 100%, condensation (water droplets) forms on the vegetables, promoting rapid fungal growth and rot.
*   *Action:* The ESP32 IoT controller will use the **DHT22/SHT31 sensor** to monitor internal humidity.
*   *Logic implementation:* If internal humidity > 95%, the ESP32 will momentarily trigger the evaporator fan (even if the compressor is off) to circulate air over the frozen PCM panels. The cold PCM panels act as a dehumidifier, pulling excess moisture out of the air and keeping humidity in the safe 85%-90% range.

## 4. Local Economic Impact
*   **Current State:** A farmer in rural Jorhat loses up to 30% of their tomato crop to rot during transport delays or is forced into "distress sales" to middlemen at ₹10/kg because they cannot store it.
*   **Future State:** Using this decentralized mini cold-storage, the farmer cooperative can store 1,000 kg of tomatoes for 2 weeks using zero grid electricity. They can wait out market gluts and sell directly to urban markets (like Guwahati) at ₹30/kg.
*   **ROI (Return on Investment):** With the capital cost reduced by 50% (due to replacing expensive lithium batteries with cheap PCM), the cooperative can recover the cost of this system in **less than 1.5 years** through increased crop yield and better market pricing.
