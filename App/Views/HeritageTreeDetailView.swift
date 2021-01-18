import MapKit
import SwiftUI

struct HeritageTreeDetailView: View {
    let tree: HeritageTree

    private var viewModel: HeritageTreeViewModel { HeritageTreeViewModel(tree: tree) }

    var body: some View {
        VStack {
            if let coordinate = viewModel.coordinate {
                HeritageTreeMapView(coordinate: coordinate, viewModel: viewModel)
                    .frame(height: 200)
            }
            List {
                HeritageTreeAttributeRows(viewModel: viewModel)
            }
        }
        .navigationBarTitle(viewModel.uniqueName, displayMode: .inline)
    }
}

private struct HeritageTreeAttributeRows: View {
    let viewModel: HeritageTreeViewModel

    var body: some View {
        AttributeRow(name: "Common name", value: viewModel.commonName)
        AttributeRow(name: "Scientific name", value: viewModel.scientificName)
        AttributeRow(name: "Address", value: viewModel.address)
        AttributeRow(name: "Neighborhood", value: viewModel.neighborhood)
        AttributeRow(name: "Height", value: viewModel.height)
        AttributeRow(name: "Spread", value: viewModel.spread)
        AttributeRow(name: "Circumference", value: viewModel.circumference)
        AttributeRow(name: "Diameter", value: viewModel.diameter)
        AttributeRow(name: "Notes", value: viewModel.notes)
        AttributeRow(name: "Tree fact", value: viewModel.treeFact)
    }
}

private struct AttributeRow: View {
    let name: String
    let value: String?

    var body: some View {
        if let value = value {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.gray)
                    .font(.caption)
                Text(value)
            }
        }
    }
}

struct HeritageTreeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HeritageTreeDetailView(tree: HeritageTree.preview)
        }
    }
}
