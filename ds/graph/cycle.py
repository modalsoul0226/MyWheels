from typing import List


class Solution:
    def to_graph(self, V: int, E: List[List[int]]) -> List[List[int]]:
        """Concert the set of edges to a directed graph in the form of adjacency list.

        Parameters
        ----------
        V : int
            The number of vertices
        E : List[List[int]]
            The set of edges

        Returns
        -------
        List[List[int]]
            Directed graph in the form of adjacency list
        """
        G = [[] for _ in range(V)]
        for e in E:
            # an edge from v1 to v2
            v1, v2 = e
            # update the list of outgoing edges
            G[v1].append(v2)

        return G

    def dfs(self, v: int, G: List[List[int]], visited: List[int]):
        """Perform a depth-first search and check if the graph is acyclic.

        Parameters
        ----------
        v : int
            The current vertex
        G : List[List[int]]
            Directed graph in the form of adjacency list
        visited : List[int]
            The visited array, visited[v] can be:
            * -1 meaning v is being visited, i.e. in the current recursion stack
            * 1 meaning v has been visited (as well as all vertices reachable)
            * 0 means v has not been visited

        Returns
        -------
        bool
            Whether the graph is acyclic or not
        """
        # a cycle is detected here as vertex v
        # is still being visited in the current path
        if visited[v] == -1:
            return False
        # we've visited v before and the sub-graph
        # with v as the source/entry is acyclic
        elif visited[v] == 1:
            return True

        visited[v] = -1

        for n in G[v]:
            if not self.dfs(n, G, visited):
                return False

        # mark v as visited, the path formed
        # by all vertices reachable from v is acyclic
        visited[v] = 1

        return True

    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        G = self.to_graph(numCourses, prerequisites)
        visited = [0 for _ in range(numCourses)]

        for v in range(numCourses):
            if not self.dfs(v, G, visited):
                return False

        return True
