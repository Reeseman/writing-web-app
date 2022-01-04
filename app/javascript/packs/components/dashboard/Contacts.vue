<template>
  <div id="Contacts.vue">
    <p v-show="this.error.length > 0" style="color: red;">{{this.error}}</p>
    <h3>Add New Contact</h3>
    <form v-on:submit.prevent="create">
      <input v-model="form.email" type="text" placeholder="Email" @change="clearError" />
      <div style="display: inline-block; width: 200px;">
        <BaseButton cta="Request Contact"/>
      </div>
    </form>

    <div v-show="this.contacts.length > 0">
      <h3>Contacts</h3>
      <ul>
        <li v-for="contact in this.contacts" :key="contact.id">
          {{ contact.user_id_1 }}, {{ contact.user_id_2 }}
        </li>
      </ul>
    </div>

    <div v-show="this.inboundContacts.length > 0">
      <h3>Pending Inbound Requests</h3>
      <ul>
        <li v-for="contact in this.contacts" :key="contact.id">
          {{ contact.user_id_1 }}, {{ contact.user_id_2 }}
        </li>
      </ul>
    </div>

    <div v-show="this.outboundContacts.length > 0">
      <h3>Pending Outbound Requests</h3>
      <ul>
        <li v-for="contact in this.outboundContacts" :key="contact.id">
          {{ contact.user_id_1 }}, {{ contact.user_id_2 }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import BaseButton from 'components/base/BaseButton'
  export default {
    name: 'Contacts',
    data: function() {
      return {
        inboundContacts: [],
        contacts: [],
        outboundContacts: [],
        error: '',
        form: {
          'email': '',
        }
      };
    },
    components: {
      BaseButton,
    },
    methods: {
      create() {
        const fromUid = JSON.parse(this.$cookie.get('session'))['user']['id'];
        const body = { email: this.form.email, fromUid: fromUid };
        this.$http.get(`/make_connection?fromUid=${fromUid}&email=${this.form.email}`)
          .then(response => {
            this.outboundContacts.push(response.data);
          })
          .catch(error => console.log(error))
          // .catch(error => this.error = '' + error)
      },
      clearError() {
        this.error = '';
      },
    },
    beforeCreate() {
      this.$http.get(`/connections?token=${this.$cookie.get('session')}`, { })
        .then(response => {
          var contacts = response.data;
          for (var i = 0; i < contacts.length; i += 1) {
            if (contacts[i].accepted) {
              this.contacts.push(contacts[i]);
            } else {
              if (JSON.parse(this.$cookie.get('session'))['user']['id'] === contacts[i].user_id_1) {
                this.outboundContacts.push(contacts[i]);
              } else {
                this.inboundContacts.push(contacts[i]);
              }
            }
          }
        })
        .catch(error => console.log(error))
    },
   };
</script>

<style lang="scss" scoped>
  @import 'application.scss';
  form > input {
      -webkit-border-radius: 3px;
      -moz-border-radius: 3px;
      border-radius: 3px;
      font-family: Arial;
      font-size: 15px;
      line-height: 20px;
      width: 250px;
      padding: 10px;
      background-color: $whiteSpace;
      border: solid $darkOrange 1px;
      text-decoration: none;
      display: inline-block;
  }

  form > input:focus {
      border: solid $darkOrange 1px !important;
      outline-offset: 0px !important;
      outline: none !important;
  }
</style>
