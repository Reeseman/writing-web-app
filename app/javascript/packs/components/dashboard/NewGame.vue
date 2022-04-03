<template>
  <div id="NewGame.vue" class="container">
    <!-- <div class="cardContainer">
      <div class="card">
        <span>One Word</span>
      </div>
    </div> -->
    <form>
      <div class="inputContainer">
        <span>General type of writ: </span>
        <select v-model="form.writType">
          <option value="Poem">Poem</option>
          <option value="Short Story">Short Story</option>
          <option value="Novel">Novel</option>
          <option value="One Word" disabled>One Word (coming soon)</option>
        </select>
      </div>
      <div class="inputContainer">
        <span>Maximum word count per entry: </span>
        <input type="number" v-model="form.maxEntryWordCount" placeholder="Maximum word count per entry" />
      </div>
      <div class="inputContainer">
        <span>Minimum word count per entry: </span>
        <input type="number" v-model="form.minEntryWordCount"  placeholder="Minimum word count per entry"/>
      </div>
      <div class="inputContainer">
        <span>Maximum word count for the entire writ: </span>
        <input type="number" v-model="form.maxTotalWordCount" placeholder="Maximum word count total" />
      </div>
      <div class="inputContainer">
        <span>Minimum word count for the entire writ: </span>
        <input type="number" v-model="form.minTotalWordCount" placeholder="Minimum word count total" />
      </div>
      <BaseButton cta="Start Collaboration" :onClick="createWrit"/>
    </form>
  </div>
</template>

<script>
  import BaseButton from 'components/base/BaseButton';

  export default {
    name: 'NewGame',
    data: function() {
      return {
        form: {
          writType: 'Poem',
          collaborators: [],
          maxEntryWordCount: 40,
          minEntryWordCount: 1,
          maxTotalWordCount: 100,
          minTotalWordCount: 2,
        },
      }
    },
    components: {
      BaseButton,
    },
    beforeCreate() {

    },
    methods: {
      createWrit() {
      }
    }
    // props: {
    //    cta: String,
    // }
  };
</script>

<style lang="scss" scoped>
  @import 'application.scss';

  .container {
    background-color: $medBlue;
    overflow: hidden;
    position: absolute;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center; /*centers items on the line (the x-axis by default)*/
    align-items: center; /*centers items on the cross-axis (y by default)*/

    form {
      max-width: 500px;
      border: 1px solid $darkOrange;
      border-radius: 23px;
      padding: 20px 30px 30px 30px;
      margin-top: 40px;
      margin-right: 160px;
      background-color: $offWhite;
    }

    .inputContainer {
      margin: 14px 0 14px 0;
      & > input, select {
        margin-top: 5px;
        display: block;
      }
    }
  }
</style>
