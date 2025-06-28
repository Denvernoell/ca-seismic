# def bearing_to_azimuth(bearing):
#     # Azimuth is the same as the clockwise bearing from North
#     azimuth = bearing % 360
#     return azimuth


# def azimuth_to_bearing(azimuth):
#     # Standard quadrant bearing conversion
#     if 0 <= azimuth < 90:
#         deg = azimuth
#         quad = "N{:.0f}E".format(deg)
#     elif 90 <= azimuth < 180:
#         deg = 180 - azimuth
#         quad = "S{:.0f}E".format(deg)
#     elif 180 <= azimuth < 270:
#         deg = azimuth - 180
#         quad = "S{:.0f}W".format(deg)
#     else:  # 270 <= azimuth < 360
#         deg = 360 - azimuth
#         quad = "N{:.0f}W".format(deg)
#     return quad


# def main():
#     print("AZIMUTH/BEARING")
#     results = []
#     # Optionally, let user set starting azimuth; default to 0 (North)
#     start_input = input("Starting azimuth (degrees, blank for 0): ").strip()
#     if start_input == "":
#         current_azimuth = 0.0
#     else:
#         try:
#             current_azimuth = float(start_input) % 360
#         except ValueError:
#             print("Invalid input. Using 0 as starting azimuth.")
#             current_azimuth = 0.0
#     step = 1
#     while True:
#         user_input = input(
#             f"Turn angle at point {step} (degrees, blank or 'done' to finish): "
#         ).strip()
#         if user_input == "" or user_input.lower() == "done":
#             break
#         try:
#             turn = float(user_input)
#         except ValueError:
#             print("Invalid input. Please enter a number, blank, or 'done'.")
#             continue
#         # Add turn, then subtract 180 to get forward azimuth
#         current_azimuth = (current_azimuth + turn - 180) % 360
#         bearing_str = azimuth_to_bearing(current_azimuth)
#         results.append((turn, current_azimuth, bearing_str))
#         print(f"AZIMUTH: {current_azimuth:.2f}")
#         print(f"BEARING: {bearing_str}")
#         step += 1
#     print("\nSummary:")
#     for i, (turn, azimuth, bearing_str) in enumerate(results, 1):
#         print(f"{i}. Turn: {turn:.2f}  Azimuth: {azimuth:.2f}  Bearing: {bearing_str}")


# if __name__ == "__main__":
#     main()
def compute_azimuths_and_bearings(angles):
    azimuths = []
    bearings = []

    current_azimuth = 0
    for angle in angles:
        current_azimuth = (current_azimuth + angle) % 360
        azimuths.append(current_azimuth)

        # Convert azimuth to bearing
        if 0 <= current_azimuth < 90:
            bearing = f"N{current_azimuth}E"
        elif 90 <= current_azimuth < 180:
            bearing = f"S{180 - current_azimuth}E"
        elif 180 <= current_azimuth < 270:
            bearing = f"S{current_azimuth - 180}W"
        else:
            bearing = f"N{360 - current_azimuth}W"

        bearings.append(bearing)

    return azimuths, bearings


# Angles to the right from the image: A-B, B-C, C-D, D-E, E-F
angles_to_right = [125, 146, 138, 51, 144]  # E-F has two angles added

azimuths, bearings = compute_azimuths_and_bearings(angles_to_right)

# Display results
for i, (az, br) in enumerate(zip(azimuths, bearings), start=1):
    print(f"Line {i}: Azimuth = {az}°, Bearing = {br}")
