---
title: From Furnace to Firmware
sub_title: A Hobbyist Embedded Rust Adventure with ESP32
authors:
  - Thomas Fisker Christensen (tfc@lindcapital.com / thomas@chrstnsn.dk)
theme:
  name: catppuccin-latte
  override:
    footer:
      style: template
      left: "Thomas Christensen"
      center: " 🌊🌡️"
      right: "{current_slide} / {total_slides}"
---

# Slides are here

```bash +exec_replace +no_background
url="https://github.com/thomaschrstnsn/rust-aarhus-nov-2024/"
echo "$url"| qrencode -t utf8i
echo "$url"
```

# Agenda

![image:width:50%](./pics/lan_party.jpeg)

![pool](./pics/pool_night_lights_crop.png)

Setup
---

```bash +exec_replace +no_background
cat << EOF | puml
@startuml

artifact artifact1
artifact artifact2
artifact artifact3
artifact artifact4
artifact1 --> artifact2
artifact1 --* artifact3
artifact1 --o artifact4
artifact1 --+ artifact5

@enduml
EOF
```


The end
---
# Slides are here

```bash +exec_replace +no_background
url="https://github.com/thomaschrstnsn/rust-aarhus-nov-2024/"
echo "$url"| qrencode -t utf8i
echo "$url"
```


