import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// flatpickr(".datepicker", {
//   altInput: true
// })

flatpickr(".start_date", {
  altInput: true,
  dateFormat: "d.m.Y",
  "plugins": [new rangePlugin({ input: ".end_date"})]
})
