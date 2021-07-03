# BetterToStrings

## Installation
### Swift Package Manager
Add `https://github.com/cameronshemilt/BetterToStrings` to your [Package Dependencies](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Usage

This Package offers improved `toString()` methods on the following Types:

- [Dates](#date)
- [Numbers](#numbers)

### Date

Use `toString(format: String)` on a Date to receive  the corresponding string to your format.

The format is the same as you would use in a `DateFormatter()`. An exact guide can be found [here](https://www.datetimeformatter.com/how-to-format-date-time-in-swift#patterns).


#### Preset Formats
This Package also offers some Date Format presets. You can use them via the `DateFormat`-enum as an optional convenience method: `toString(_ dateFormat: DateFormat)`.

| **Case**            | **Date Format**           | **Example Output**          |
| ------------------- | ------------------------- | --------------------------- |
| `.debug`            | `"YYYY-MM-dd HH:mm:ss Z"` | 1970-01-01 00:00:00 +0000   |
| `.date`             | `"YYYY-MM-dd"`            | 1970-01-01                  |
| `.europeanDate`     | `"dd.MM.YYYY"`            | 01.01.1970                  |
| `.americanDate`     | `"MM/dd/YYYY"`            | 01/01/1970                  |
| `.spelledDate`      | `"dd. MMMM YYYY"`         | 01. January 1970            |
| `.spelledDateShort` | `"dd. MMM. YYYY"`         | 01. Jan. 1970               |
| `.time`             | `"HH:mm:ss"`              | 00:00:00                    |
| `.meridiemTime`     | `"hh:mm:ss a"`            | 00:00:00 AM                 |
| `.timeZone`         | `"Z (zzzz)"`              | +0000 (Greenwich Mean Time) |


### Numbers

Supported numbers are `Int`, `Float` and `Double`.

The function `toString(abbreviation: AbbreviationStyle, maxSize: Int?, maxFractionDigits: Int?)` allows you to customise the resulting String with the following parameters:

| **Parameter**       | **Type**            | **Default Value** | **Description**                                              |
| ------------------- | ------------------- | ----------------- | ------------------------------------------------------------ |
| `abbreviation`      | `AbbreviationStyle` | `.none`           | The abbreviation style. More information [here](abbreviation-styles). |
| `maxSize`           | `Int?`              | `nil`             | The maximum count of characters the resulting string may have. This includes *-*, *K*, *M* etc., but excludes the decimal point. |
| `maxFractionDigits` | `Int?`              | `nil`             | The maximum count of fraction digits the resulting String may have. |

#### Abbreviation Styles

| **Case**       | **Symbol** | **Description**                                              |
| -------------- | ---------- | ------------------------------------------------------------ |
| `.none`        | none       | Does not alter the number.                                   |
| `.thousand`    | K          | Displays the number in thousands and appends a *K*.          |
| `.million`     | M          | Displays the number in millions and appends a *M*.           |
| `.intelligent` | Depending  | Automatically switches the abbreviation style, depending on the size of the number. |

