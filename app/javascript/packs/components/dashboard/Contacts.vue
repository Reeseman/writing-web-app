<template>
  <div id="Contacts.vue">
    <p
      v-show="error.length > 0"
      style="color: red;"
    >
      {{ error }}
    </p>
    <p
      v-show="success.length > 0"
      style="color: green;"
    >
      {{ success }}
    </p>
    <h3>Add New Contact</h3>
    <form @submit.prevent="create">
      <input
        v-model="form.email"
        type="text"
        placeholder="Email"
        @change="clearError"
      >
      <div style="display: inline-block; width: 200px;">
        <BaseButton cta="Request Contact" />
      </div>
    </form>

    <div v-show="contacts.length > 0">
      <h3>Contacts</h3>
      <ul>
        <li
          v-for="contact in contacts"
          :key="contact.id"
        >
          {{ contact.user_id_1 }}, {{ contact.user_id_2 }}
        </li>
      </ul>
    </div>

    <div v-show="inboundContacts.length > 0">
      <h3>Pending Inbound Requests</h3>
      <ul>
        <li
          v-for="contact in contacts"
          :key="contact.id"
        >
          {{ contact.user_id_1 }}, {{ contact.user_id_2 }}
        </li>
      </ul>
    </div>

    <div v-show="outboundContacts.length > 0">
      <h3>Pending Outbound Requests</h3>
      <ul>
        <li
          v-for="contact in outboundContacts"
          :key="contact.id"
        >
          {{ contact.user_id_1 }}, {{ contact.user_id_2 }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import BaseButton from 'components/base/BaseButton';
export default {
  name: 'Contacts',
  components: {
    BaseButton,
  },
  data: function() {
    return {
      inboundContacts: [],
      contacts: [],
      outboundContacts: [],
      error: '',
      success: '',
      form: {
        'email': '',
      }
    };
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
      .catch(error => console.log(error));
  },
  methods: {
    create() {
      const fromUid = JSON.parse(this.$cookie.get('session'))['user']['id'];
      this.$http.get(`/make_connection?fromUid=${fromUid}&email=${this.form.email}`)
        .then(response => {
          this.outboundContacts.push(response.data);
        })
        .catch(error => {
          if (error.response) {
            this.error = error.response.data.error;
          } else {
            this.error = 'Internal server error: unknown';
          }
        });
    },
    delete() {
      const fromUid = JSON.parse(this.$cookie.get('session'))['user']['id'];
      this.$http.get(`/delete_connection?fromUid=${fromUid}&email=${this.form.email}`)
        .then()
        .catch(error => {
          if (error.response) {
            this.error = error.response.data.error;
          } else {
            this.error = 'Internal server error: unknown';
          }
        });
    },
    clearError() {
      this.error = '';
    },
    clearSuccess() {
      this.success = '';
    },
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
