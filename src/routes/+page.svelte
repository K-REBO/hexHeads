<script>
    import TailwindCss from "../routes/+layout.svelte";
    let ope = '+';
    let a = 0;
    let b = 0;
    let ans = 0;
    let limit = 100;
    let history = [];
    let isDivisible = true;

    function pushValue2hst() {
        history.push({
            a: a,
            b: b,
            ope: ope,
            ans: ans
        });
        console.log(history);
    }

    function changeLimit(x) {
        limit = x;
    }

    function init() {
        isDivisible = true;
        a = Math.round(Math.random() * limit);
        b = Math.round(Math.random() * limit);
        calculate_with_operator(ope);
        pushValue2hst();
        console.log(limit);
    };
    function change_operator(x) {
        // handle error case when * + - / is not selected
        if (x == '+' || x == '-' || x == '*' || x == '/') {
            ope = x;
            calculate_with_operator(ope);
            pushValue2hst();
        }else {
            console.log(`operation error:${x}`);
        }
    }

    function calculate_with_operator(ope) {
        let answer = 0;
        switch(ope) {
            case '+':
                answer = a + b;
                break;
            case '-':
                answer = a - b;
                break;
            case '*':
                answer = a * b;
                break;
            case '/':
                while(b == 0) {
                    b = Math.round(Math.random() * limit);
                }
                isDivisible = a % b == 0;
                answer = a / b;
                break;
            default:
                console.log("Error");
                break;
        }

        ans = Math.round(answer * 16) / 16;
    }
    
    init();
</script>
<TailwindCss />

<svelte:head>
    <title>Hex Heads</title>
</svelte:head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@300;400;900&display=swap');
</style>

<div class="flex-col justify-stretch space-y-32 text-gray-300">
    <div class="text-center">
        <a class="font-bold text-3xl underline" href="https://20b.bido.dev">Hex Heads{ope}</a>
        <p class="text-center">Let's calculate <strong>Hex</strong> in your head cuz it's cool like guru <a href="https://www.tumblr.com/banker-hacker/82297634601/yeah-i-know-what-binary-is-jesus-christ-i">Hacker</a>.</p>
    </div>
    
    
    <div>
        <div class="text-center text-5xl sm:text-6xl">
            <span>{a.toString(16)}</span>
            {ope}
            <span>{b.toString(16)}</span>
            {
                isDivisible ? "=":"≃"
            }
            <span>{ans.toString(16)}</span>
        </div>
        <div class="text-center text-gray-900">
            <span>{a}</span>
            {ope}
            <span>{b}</span>
            {
                isDivisible ? "=":"≃"
            }
            <span>{ans}</span>
        </div>
    </div>
    
    <div class="flex sm:flex-row justify-center gap-6  text-center text-3xl sm:text-2xl"
    style="align-items:center"
    >
        <div class="flex gap-5" style="height:fit-content">
            <button on:click={() => change_operator('+')} class=" rounded-sm px-2 font-bold"
                style="background:#338391">
                +
            </button>
            <button on:click={() => change_operator("-")} class=" rounded-sm px-2 font-bold"
                style="background:#338391">
                -
            </button>
            <button on:click={() => change_operator("*")} class=" rounded-sm px-2 font-bold"
                style="background:#338391">
                *
            </button>
            <button on:click={() => change_operator("/")} class=" rounded-sm px-2 font-bold"
                style="background:#338391">
                /
            </button>
        </div>
        <div>
            <button class="rounded-sm bg-red-400 px-2"
            on:click={() => changeLimit(16)}>
            16</button>
            <button class="rounded-sm bg-red-600 px-2"
            on:click={() => changeLimit(16*2)}>
            1A</button>
            <button class="rounded-sm bg-red-700 px-2"
            on:click={() => changeLimit(255)}>
            FF</button>
        </div>
        
        <button on:click={init} class=" rounded-sm px-2"
        style="height:fit-content;background:#338391">
        Next
        </button>
    </div>
    <footer>
        <p class="flex space-x-8">
            <span class="italic">
                Copyright&copy;
                <a href="https://bido.dev">bido</a>
                2023.
                All rights Reserved.
                See 
                <a href="https://blog.bido.dev/policies/site">site policy</a>
            </span>
            <a href="https://blog.bido.dev/humans.txt">humans.txt</a>
            <a href="https://github.com/K-REBO/hexHeads">GitHub</a>
        </p>
    </footer>
</div>