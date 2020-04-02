// Random tree
const N = 80;
const gData = {
    nodes: [...Array(N).keys()].map(i => ({
        id: i,
        path: "~/",
        line: i + 1
    })),
    links: [...Array(N).keys()]
        .filter(id => id)
        .map(id => ({
            source: id,
            target: Math.round(Math.random() * (id - 1))
        }))
};

let highlightNodes = [];
let highlightLink = null;

const Graph = ForceGraph3D()
    (document.getElementById('3d-graph'))
    .graphData(gData)
    .nodeColor(node => highlightNodes.indexOf(node) === -1 ? 'rgba(0,255,255,0.6)' : 'rgb(255,0,0,1)')
    .linkWidth(link => link === highlightLink ? 4 : 1)
    .linkDirectionalParticles(link => link === highlightLink ? 4 : 0)
    .linkDirectionalParticleWidth(4)
    .onNodeHover(node => {
        // no state change
        if ((!node && !highlightNodes.length) || (highlightNodes.length === 1 && highlightNodes[0] === node)) return;

        highlightNodes = node ? [node] : [];

        updateHighlight();
    })
    .onLinkHover(link => {
        // no state change
        if (highlightLink === link) return;

        highlightLink = link;
        highlightNodes = link ? [link.source, link.target] : [];

        updateHighlight();
    });

function updateHighlight() {
    // trigger update of highlighted objects in scene
    Graph
        .nodeColor(Graph.nodeColor())
        .linkWidth(Graph.linkWidth())
        .linkDirectionalParticles(Graph.linkDirectionalParticles());
}

window.addEventListener('resize', function () {
    Graph
        .width(window.innerWidth)
        .height(window.innerHeight)
});