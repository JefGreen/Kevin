import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import { quiz } from "./plugins/quiz";

import { initMapbox } from './plugins/init_mapbox';


quiz();


 // <-- you need to uncomment the stylesheet_pack_tag in the layout!

initMapbox();
