# SIH26005: System Architecture & Visual Designs

This document provides the formal structural and logic designs required to build and pitch the system. These text-based diagrams (Mermaid.js) can be copied directly into presentation software or markdown viewers.

## 1. Power & Cooling Flow Architecture (The 3-Stage Logic)

This diagram illustrates how energy moves from the sun to the vegetables, highlighting our 3-Stage innovation.

```mermaid
graph TD
    %% Source
    Sun[Solar PV Array 3.5kW] -->|DC Power| ChargeController(MPPT Charge Controller)
    Grid[Optional Grid Backup] -.->|AC to DC| ChargeController

    %% Power Routing
    ChargeController -->|Primary Power| Battery[Stage 2: LiFePO4 Electrical Battery 4.8kWh]
    ChargeController -->|Direct Power| Compressor[Stage 1: BLDC Variable Speed Compressor]
    Battery -->|Backup Power| Compressor

    %% Refrigeration Cycle
    Compressor -->|Pump Refrigerant| Condenser[Outside Condenser Coil]
    Condenser --> ExpansionValve[Expansion Valve]
    ExpansionValve --> Evaporator[Inside Evaporator Coil]

    %% Thermal Transfer
    Evaporator -->|Active Cooling| RoomAir[Cold Room Air]
    Evaporator -->|Active Cooling / Freezing| PCM[Stage 3: PCM Thermal Battery 120kg]

    %% Passive Stage
    PCM -.->|Passive Cooling at Night| RoomAir
    RoomAir --> Veggies((Fresh Vegetables 4°C - 10°C))

    %% Styling
    style Sun fill:#f9d0c4,stroke:#333,stroke-width:2px
    style PCM fill:#bbf,stroke:#333,stroke-width:2px
    style Veggies fill:#dfd,stroke:#333,stroke-width:2px
```

## 2. IoT & Cloud Data Architecture

This details how the system satisfies the "Smart Monitoring" requirement of the problem statement.

```mermaid
flowchart LR
    subgraph Cold Storage Edge System
        Sensors[DS18B20 Temp x4, DHT22 Humidity, PZEM-017 Power]
        MCU[ESP32 Microcontroller w/ FreeRTOS]
        Display[Nextion Local LCD Touchscreen]
        Relays[Compressor & Fan Control Relays]

        Sensors --> MCU
        MCU <--> Display
        MCU --> Relays
    end

    subgraph Connectivity
        WiFi[Local Wi-Fi]
        GSM[SIM800L 4G Fallback]

        MCU --> WiFi
        MCU --> GSM
    end

    subgraph Cloud & User App
        AWS[AWS IoT Core / MQTT]
        DB[(Firebase Realtime DB)]
        App((Farmer Mobile App / SMS Alerts))

        WiFi & GSM --> AWS
        AWS --> DB
        DB --> App
    end
```

## 3. Physical Layout & Structural Modularity Design (For NER Terrain)

Because the NER terrain is difficult, the physical design must be "knock-down" and modular.

```mermaid
block-beta
  columns 3
  space:3
  PanelFront["Front PUF Panel (Insulated Door)"]:1 Roof["Top PUF Panel"]:1 PanelBack["Back PUF Panel"]:1
  space:3
  PanelLeft["Left PUF Panel"]:1 PCM_Mount["Ceiling Mounted PCM Flats"]:1 PanelRight["Right PUF Panel"]:1
  space:3
  CompressorUnit["External Compressor & Solar Unit (PPGI Housing)"]:1 Floor["Floor PUF Panel"]:1 Sensors["Internal Sensor Array"]:1

  style PCM_Mount fill:#bbf
  style CompressorUnit fill:#f9f
```

### Physical Design Rules for Construction:
1. **Knock-Down Assembly:** The 6 PUF panels (walls, floor, roof) use cam-locks. They can be carried by a small pickup truck or even a tractor up a hill and assembled in 2 hours using an Allen key.
2. **Top-Mounted PCM:** The Phase Change Material flats are mounted to the ceiling. Because cold air sinks, as the PCM melts at night, the cold air naturally falls over the vegetables without needing the fan, saving even more battery power.
3. **Rust Prevention:** The external compressor housing is made of Pre-Painted Galvanized Iron (PPGI) to prevent rust from heavy NER monsoons.
