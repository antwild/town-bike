import "bootstrap";
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { initSweetalert } from '../plugins/init_sweetalert';
if (document.getElementById("new_payment")) {
  initSweetalert('#sweetalert', {
    title: "Successful Payment ",
    text: "Your payment has been approved",
    icon: "success"
  }, (value) => {
    const form = document.getElementById("new_payment");
    form.submit();
  });
}
