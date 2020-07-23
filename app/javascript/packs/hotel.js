import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';

Vue.use(VueResource)
document.addEventListener('DOMContentLoaded', () => {
    Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    var element = document.getElementById("hotel-form")
    if (element != null) {
        var hotels = JSON.parse(element.dataset.hotels)
        var booking = JSON.parse(element.dataset.booking)
        var booking_rooms_attributes = JSON.parse(element.dataset.bookingrooms)
        if(booking_rooms_attributes.length == 0) {
            booking_rooms_attributes = [
                {
                    id: null,
                    hotel_id: 0,
                    room_id: null
                }
            ]
        }
        booking.booking_rooms_attributes = booking_rooms_attributes
        if (booking.check_in_day) {
            booking.check_in_day = new Date(booking.check_in_day)
            booking.check_out_day = new Date(booking.check_out_day)
        }

        var hotelList = [
            {
                id: 0,
                name: "Choose Hotel",
                rooms:[]
            }
        ]
        hotels.forEach(element => {
            hotelList[element.id] = element
        });


        var app = new Vue({
            el: element,
            components: { DatePicker },
            data: function() {
                return {
                    hotels: hotelList,
                    booking: booking,
                    errors: "",
                }
            },
            methods: {
                addRooms: function() {
                    this.booking.booking_rooms_attributes.push({
                        id:null,
                        hotel_id: 0,
                        room_id: null
                    })
                },
                rmBookingRoom: function (index) {
                    this.booking.booking_rooms_attributes.splice(index, 1);
                },
                saveBooking: function () {
                    this.booking.booking_rooms_attributes.forEach(el => {
                        if (!el.hotel_id || !el.room_id) {
                            alert("Please! Add hotel and room")
                            return false;
                        }
                    })
                    if (this.booking.id == null) {
                        this.$http.post('/admins/bookings', { booking: this.booking }).then(response => {
                            var json = JSON.parse(response.bodyText);
                            window.location.href = `/admins/bookings/${json.id}/edit`;
                        }, response => {
                            console.log(response)
                            this.errors = "Create fail!"
                        })
                        // Edit an existing team
                    } else {
                        this.$http.put(`/admins/bookings/${this.booking.id}`, { booking: this.booking }).then(response => {
                            window.location.href = `/admins/bookings/${this.booking.id}/edit`;
                        }, response => {
                            console.log(response)
                            this.errors = "Update fail!"
                        })
                    }
                }
            }
        })
    }
})
